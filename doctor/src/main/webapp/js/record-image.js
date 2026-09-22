/**
 * 百度识图：上传病历/检查报告图片
 * RecordImage.recognize(file) -> { results, imageContext }
 * RecordImage.bindUploadButton({ button, fileInput, onResult })
 */
(function (global) {
  const API = '/doctor/ai/recognizeImage';

  async function compressImage(file) {
    if (!file || !file.type || file.type.indexOf('image/') !== 0) return file;
    if (file.size < 800 * 1024) return file;
    try {
      const bitmap = await createImageBitmap(file);
      const maxEdge = 1600;
      const scale = Math.min(1, maxEdge / Math.max(bitmap.width, bitmap.height));
      const w = Math.max(1, Math.round(bitmap.width * scale));
      const h = Math.max(1, Math.round(bitmap.height * scale));
      const canvas = document.createElement('canvas');
      canvas.width = w;
      canvas.height = h;
      canvas.getContext('2d').drawImage(bitmap, 0, 0, w, h);
      if (bitmap.close) bitmap.close();
      const blob = await new Promise((resolve) => canvas.toBlob(resolve, 'image/jpeg', 0.85));
      if (!blob) return file;
      return new File([blob], (file.name || 'image').replace(/\.\w+$/, '') + '.jpg', { type: 'image/jpeg' });
    } catch (e) {
      return file;
    }
  }

  async function recognize(file) {
    const packed = await compressImage(file);
    const fd = new FormData();
    fd.append('file', packed);
    const res = await fetch(API, { method: 'POST', body: fd, credentials: 'include' }).then((r) => r.json());
    if (!res || res.code !== 1) {
      throw new Error((res && res.msg) || '识图失败');
    }
    const content = res.content || { results: [], imageContext: '' };
    if (!content.imageContext && (!content.results || !content.results.length)) {
      throw new Error(res.msg || '未识别到内容');
    }
    return content;
  }

  function bindUploadButton(options) {
    const btn = typeof options.button === 'string' ? document.querySelector(options.button) : options.button;
    let fileInput = typeof options.fileInput === 'string' ? document.querySelector(options.fileInput) : options.fileInput;
    if (!btn) return;

    if (!fileInput) {
      fileInput = document.createElement('input');
      fileInput.type = 'file';
      fileInput.accept = 'image/*';
      fileInput.style.display = 'none';
      document.body.appendChild(fileInput);
    }

    btn.addEventListener('click', () => fileInput.click());
    fileInput.addEventListener('change', async () => {
      const file = fileInput.files && fileInput.files[0];
      fileInput.value = '';
      if (!file) return;
      const oldText = btn.textContent;
      btn.disabled = true;
      btn.textContent = '识别中…';
      try {
        const data = await recognize(file);
        if (typeof options.onResult === 'function') {
          options.onResult(data, file);
        }
      } catch (e) {
        alert(e.message || '识图失败，请稍后重试');
      } finally {
        btn.disabled = false;
        btn.textContent = oldText;
      }
    });
  }

  global.RecordImage = { recognize, bindUploadButton };
})(window);
