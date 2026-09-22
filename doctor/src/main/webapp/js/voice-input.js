/**
 * 语音转文字：长按录音为 16k 单声道 WAV（百度 ASR 不支持浏览器默认 webm）。
 * 用法：VoiceInput.bind({ button: '#voice-btn', input: '#message-input' })
 */
(function (global) {
  const API = '/doctor/ai/voice/recognize';
  const MAX_MS = 60000;
  const TARGET_RATE = 16000;

  function ensureStyles() {
    if (document.getElementById('voice-input-style')) return;
    const style = document.createElement('style');
    style.id = 'voice-input-style';
    style.textContent = `
      .voice-btn {
        padding: 12px 16px; border-radius: 12px; border: 1px solid rgba(94,243,255,0.35);
        background: rgba(94,243,255,0.12); color: #b8f7ff; cursor: pointer; font-size: 14px;
        font-weight: 600; white-space: nowrap; user-select: none; touch-action: none;
      }
      .voice-btn:hover { background: rgba(94,243,255,0.2); }
      .voice-btn.recording {
        background: linear-gradient(135deg, #e85d5d, #ff8a8a); color: #fff; border-color: transparent;
        animation: voicePulse 1s infinite;
      }
      .voice-btn:disabled { opacity: 0.5; cursor: not-allowed; }
      @keyframes voicePulse {
        0%, 100% { box-shadow: 0 0 0 0 rgba(232,93,93,0.45); }
        50% { box-shadow: 0 0 0 8px rgba(232,93,93,0); }
      }
    `;
    document.head.appendChild(style);
  }

  function downsample(buffer, inRate, outRate) {
    if (inRate === outRate) return buffer;
    const ratio = inRate / outRate;
    const newLen = Math.round(buffer.length / ratio);
    const result = new Float32Array(newLen);
    let offsetResult = 0;
    let offsetBuffer = 0;
    while (offsetResult < result.length) {
      const nextOffsetBuffer = Math.round((offsetResult + 1) * ratio);
      let accum = 0;
      let count = 0;
      for (let i = offsetBuffer; i < nextOffsetBuffer && i < buffer.length; i++) {
        accum += buffer[i];
        count++;
      }
      result[offsetResult] = count ? accum / count : 0;
      offsetResult++;
      offsetBuffer = nextOffsetBuffer;
    }
    return result;
  }

  function floatTo16BitPCM(samples) {
    const pcm = new Int16Array(samples.length);
    for (let i = 0; i < samples.length; i++) {
      const s = Math.max(-1, Math.min(1, samples[i]));
      pcm[i] = s < 0 ? s * 0x8000 : s * 0x7fff;
    }
    return pcm;
  }

  function encodeWav(samples, sampleRate) {
    const pcm = floatTo16BitPCM(samples);
    const buffer = new ArrayBuffer(44 + pcm.length * 2);
    const view = new DataView(buffer);
    const writeStr = (offset, str) => {
      for (let i = 0; i < str.length; i++) view.setUint8(offset + i, str.charCodeAt(i));
    };
    writeStr(0, 'RIFF');
    view.setUint32(4, 36 + pcm.length * 2, true);
    writeStr(8, 'WAVE');
    writeStr(12, 'fmt ');
    view.setUint32(16, 16, true);
    view.setUint16(20, 1, true);
    view.setUint16(22, 1, true);
    view.setUint32(24, sampleRate, true);
    view.setUint32(28, sampleRate * 2, true);
    view.setUint16(32, 2, true);
    view.setUint16(34, 16, true);
    writeStr(36, 'data');
    view.setUint32(40, pcm.length * 2, true);
    let offset = 44;
    for (let i = 0; i < pcm.length; i++, offset += 2) {
      view.setInt16(offset, pcm[i], true);
    }
    return new Blob([buffer], { type: 'audio/wav' });
  }

  function bind(options) {
    ensureStyles();
    const btn = typeof options.button === 'string' ? document.querySelector(options.button) : options.button;
    const input = typeof options.input === 'string' ? document.querySelector(options.input) : options.input;
    if (!btn || !input) return;

    let stream = null;
    let audioCtx = null;
    let processor = null;
    let source = null;
    let timer = null;
    let recording = false;
    let chunks = [];

    const setRecording = (on) => {
      recording = on;
      btn.classList.toggle('recording', on);
      btn.textContent = on ? '松开结束' : (options.label || '按住说话');
    };

    const cleanupAudio = () => {
      if (timer) { clearTimeout(timer); timer = null; }
      try { if (processor) processor.disconnect(); } catch (_) {}
      try { if (source) source.disconnect(); } catch (_) {}
      try { if (audioCtx && audioCtx.state !== 'closed') audioCtx.close(); } catch (_) {}
      if (stream) {
        stream.getTracks().forEach((t) => t.stop());
        stream = null;
      }
      processor = null;
      source = null;
      audioCtx = null;
    };

    const upload = async (blob) => {
      btn.disabled = true;
      btn.textContent = '识别中…';
      try {
        const fd = new FormData();
        fd.append('file', blob, 'voice.wav');
        fd.append('format', 'wav');
        fd.append('rate', String(TARGET_RATE));
        const res = await fetch(API, { method: 'POST', body: fd, credentials: 'include' }).then((r) => r.json());
        const text = res && res.content && res.content.text ? String(res.content.text).trim() : '';
        if (res && res.code === 1 && text) {
          const cur = (input.value || '').trim();
          input.value = cur ? (cur + text) : text;
          input.dispatchEvent(new Event('input', { bubbles: true }));
          if (typeof options.onRecognized === 'function') options.onRecognized(text);
        } else {
          alert((res && res.msg) || '未识别到有效语音，请重试');
        }
      } catch (e) {
        alert('语音识别失败，请稍后重试');
      } finally {
        btn.disabled = false;
        setRecording(false);
        btn.textContent = options.label || '按住说话';
      }
    };

    const stop = () => {
      if (!recording) return;
      setRecording(false);
      const inRate = audioCtx ? audioCtx.sampleRate : TARGET_RATE;
      const merged = new Float32Array(chunks.reduce((n, a) => n + a.length, 0));
      let offset = 0;
      chunks.forEach((c) => { merged.set(c, offset); offset += c.length; });
      chunks = [];
      cleanupAudio();
      if (merged.length < TARGET_RATE * 0.3) {
        alert('录音太短，请长按说话');
        return;
      }
      const samples = downsample(merged, inRate, TARGET_RATE);
      upload(encodeWav(samples, TARGET_RATE));
    };

    const start = async (ev) => {
      if (ev) ev.preventDefault();
      if (recording || btn.disabled) return;
      if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
        alert('当前浏览器不支持录音');
        return;
      }
      try {
        stream = await navigator.mediaDevices.getUserMedia({
          audio: { channelCount: 1, echoCancellation: true, noiseSuppression: true }
        });
        audioCtx = new (window.AudioContext || window.webkitAudioContext)();
        source = audioCtx.createMediaStreamSource(stream);
        processor = audioCtx.createScriptProcessor(4096, 1, 1);
        chunks = [];
        processor.onaudioprocess = (e) => {
          if (!recording) return;
          chunks.push(new Float32Array(e.inputBuffer.getChannelData(0)));
        };
        source.connect(processor);
        const mute = audioCtx.createGain();
        mute.gain.value = 0;
        processor.connect(mute);
        mute.connect(audioCtx.destination);
        if (audioCtx.state === 'suspended') {
          await audioCtx.resume();
        }
        setRecording(true);
        timer = setTimeout(stop, MAX_MS);
      } catch (e) {
        cleanupAudio();
        alert('无法使用麦克风，请检查浏览器权限');
      }
    };

    btn.addEventListener('mousedown', start);
    btn.addEventListener('mouseup', stop);
    btn.addEventListener('touchstart', start, { passive: false });
    btn.addEventListener('touchend', stop);
    btn.addEventListener('touchcancel', stop);

    if (!btn.textContent.trim()) btn.textContent = options.label || '按住说话';
    btn.classList.add('voice-btn');
  }

  global.VoiceInput = { bind };
})(window);
