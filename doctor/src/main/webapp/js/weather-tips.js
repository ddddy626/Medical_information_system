/**
 * 实时天气小组件（顶栏右上角：市名 · 图标 · 温度）
 * 用法：WeatherTips.mount('#weather-tips')  或  { compact: true }
 * 默认 compact；传 { compact: false } 才渲染完整卡片。
 * 会尝试浏览器定位，失败用默认城市；每 10 分钟自动刷新。
 */
(function (global) {
  const API = '/doctor/weather/health-tips';
  const REFRESH_MS = 10 * 60 * 1000;
  const timers = new WeakMap();

  function esc(s) {
    return String(s == null ? '' : s)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  function ensureStyles() {
    if (document.getElementById('weather-tips-style')) return;
    const style = document.createElement('style');
    style.id = 'weather-tips-style';
    style.textContent = `
      .weather-widget {
        border: 1px solid rgba(142, 236, 255, 0.22);
        background: linear-gradient(135deg, rgba(12, 40, 62, 0.92), rgba(18, 52, 48, 0.88));
        border-radius: 14px;
        padding: 16px 18px;
        margin: 0 0 20px;
        color: #eafcff;
        box-shadow: 0 12px 36px rgba(0,0,0,0.22);
      }
      .weather-widget .ww-top {
        display: flex; justify-content: space-between; align-items: flex-start; gap: 16px; flex-wrap: wrap;
      }
      .weather-widget .ww-city {
        font-size: 16px; font-weight: 700; color: #fff; margin: 0 0 4px;
      }
      .weather-widget .ww-meta { font-size: 12px; color: #9eb9c9; }
      .weather-widget .ww-now {
        display: flex; align-items: flex-end; gap: 10px;
      }
      .weather-widget .ww-temp {
        font-size: 40px; font-weight: 700; color: #5ef3ff; line-height: 1; letter-spacing: -0.02em;
      }
      .weather-widget .ww-text { font-size: 15px; color: #c8ffe8; padding-bottom: 4px; }
      .weather-widget .ww-range { font-size: 12px; color: #9eb9c9; padding-bottom: 6px; }
      .weather-widget .ww-grid {
        display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 8px; margin-top: 14px;
      }
      .weather-widget .ww-item {
        background: rgba(255,255,255,0.05); border: 1px solid rgba(142,236,255,0.12);
        border-radius: 10px; padding: 8px 10px; font-size: 12px; color: #c5d8e4;
      }
      .weather-widget .ww-item b { display: block; color: #fff; font-size: 13px; margin-bottom: 2px; }
      .weather-widget .ww-tips { display: flex; flex-wrap: wrap; gap: 8px; margin-top: 12px; }
      .weather-widget .ww-tip {
        font-size: 12px; padding: 6px 10px; border-radius: 999px;
        background: rgba(94, 243, 255, 0.1); border: 1px solid rgba(94, 243, 255, 0.28); color: #b8f7ff;
      }
      .weather-widget .ww-foot {
        margin-top: 10px; font-size: 11px; color: #7a96a8; display: flex; justify-content: space-between; gap: 8px;
      }
      .weather-widget .ww-refresh {
        background: transparent; border: none; color: #5ef3ff; cursor: pointer; font-size: 11px; padding: 0;
      }
      .weather-widget.ww-loading, .weather-widget.ww-error { color: #9eb9c9; font-size: 13px; }

      /* 首页紧凑小组件：城市 · 图标 · 温度 */
      .weather-chip {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        margin: 0;
        padding: 6px 4px;
        border: none;
        background: transparent;
        box-shadow: none;
        border-radius: 0;
        color: #f2f7fb;
        font-family: "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif;
        line-height: 1;
        white-space: nowrap;
        cursor: pointer;
        user-select: none;
      }
      .weather-chip .wc-city {
        font-size: 15px;
        font-weight: 500;
        color: #fff;
        letter-spacing: 0.02em;
      }
      .weather-chip .wc-icon {
        width: 28px;
        height: 28px;
        flex: 0 0 auto;
        display: block;
      }
      .weather-chip .wc-temp {
        font-size: 15px;
        font-weight: 500;
        color: rgba(255,255,255,0.92);
        letter-spacing: 0.01em;
      }
      .weather-chip.ww-loading,
      .weather-chip.ww-error {
        font-size: 12px;
        color: rgba(255,255,255,0.55);
        padding: 6px 2px;
      }
      .home-weather-chip-wrap {
        display: inline-flex;
        align-items: center;
        margin: 0 6px 0 0;
        flex: 0 0 auto;
      }
      /* 深色顶栏页面（患者/医生）文字已是浅色，无需额外背景 */

      @media (max-width: 640px) {
        .weather-widget .ww-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
        .weather-widget .ww-temp { font-size: 32px; }
        .weather-chip .wc-city { font-size: 13px; }
        .weather-chip .wc-temp { font-size: 13px; }
        .weather-chip .wc-icon { width: 24px; height: 24px; }
      }
    `;
    document.head.appendChild(style);
  }

  function weatherIconSvg(text) {
    const t = String(text || '');
    // 晴
    if (/晴/.test(t) && !/云|阴|雨|雪/.test(t)) {
      return `<svg class="wc-icon" viewBox="0 0 32 32" aria-hidden="true">
        <circle cx="16" cy="16" r="7" fill="#FFB020"/>
        <g stroke="#FFB020" stroke-width="2" stroke-linecap="round">
          <path d="M16 3v3M16 26v3M3 16h3M26 16h3M6.5 6.5l2.2 2.2M23.3 23.3l2.2 2.2M6.5 25.5l2.2-2.2M23.3 8.7l2.2-2.2"/>
        </g>
      </svg>`;
    }
    // 雨
    if (/雨|雷/.test(t)) {
      return `<svg class="wc-icon" viewBox="0 0 32 32" aria-hidden="true">
        <path d="M10 14a6 6 0 0 1 11.6-2.2A4.5 4.5 0 0 1 24 21H10.5A4.5 4.5 0 0 1 10 14z" fill="#D7E8F5"/>
        <g stroke="#5BA4E8" stroke-width="2" stroke-linecap="round">
          <path d="M12 23l-1.5 4M16 23.5l-1.5 4M20 23l-1.5 4"/>
        </g>
      </svg>`;
    }
    // 雪
    if (/雪/.test(t)) {
      return `<svg class="wc-icon" viewBox="0 0 32 32" aria-hidden="true">
        <path d="M10 13a6 6 0 0 1 11.6-2.2A4.5 4.5 0 0 1 24 20H10.5A4.5 4.5 0 0 1 10 13z" fill="#E8F2FA"/>
        <g fill="#A8D4F0">
          <circle cx="12" cy="24" r="1.4"/><circle cx="16.5" cy="26" r="1.4"/><circle cx="21" cy="24" r="1.4"/>
        </g>
      </svg>`;
    }
    // 雾/霾
    if (/雾|霾|沙|尘/.test(t)) {
      return `<svg class="wc-icon" viewBox="0 0 32 32" aria-hidden="true">
        <g stroke="#C5D5E0" stroke-width="2.2" stroke-linecap="round">
          <path d="M6 12h16M8 17h18M6 22h14"/>
        </g>
      </svg>`;
    }
    // 阴
    if (/阴/.test(t)) {
      return `<svg class="wc-icon" viewBox="0 0 32 32" aria-hidden="true">
        <path d="M9 16a6.5 6.5 0 0 1 12.5-2.5A5 5 0 0 1 24 23H10A5 5 0 0 1 9 16z" fill="#C9D6E2"/>
      </svg>`;
    }
    // 默认：多云（太阳+云，贴近参考图）
    return `<svg class="wc-icon" viewBox="0 0 32 32" aria-hidden="true">
      <circle cx="11" cy="12" r="6" fill="#FFB020"/>
      <path d="M12 18a5.5 5.5 0 0 1 10.5-2.2A4.2 4.2 0 0 1 25 24H13a4.2 4.2 0 0 1-1-6z" fill="#E8F3FB"/>
      <path d="M8 19.5a3.8 3.8 0 0 1 6.8-2.3A3.2 3.2 0 0 1 17.5 23H9.2A3.2 3.2 0 0 1 8 19.5z" fill="#D5E7F5" opacity="0.95"/>
    </svg>`;
  }

  function shortCity(data) {
    const adm2 = data.adm2 || '';
    const city = data.cityName || '';
    if (adm2 && !looksGarbled(adm2)) {
      return /[市州盟]$/.test(adm2) ? adm2 : adm2 + '市';
    }
    if (city && !looksGarbled(city)) {
      return /[市区县]$/.test(city) ? city : city;
    }
    return '当前城市';
  }

  function looksGarbled(s) {
    return /Ã|Â|ä¸|æ|å|ç|è|é|ð|ï¿½/.test(String(s || ''));
  }

  function getPosition() {
    return new Promise((resolve) => {
      if (!navigator.geolocation) {
        resolve(null);
        return;
      }
      // 短超时：定位失败立刻走默认城市，避免拖慢首屏
      navigator.geolocation.getCurrentPosition(
        (pos) => resolve({
          lon: String(pos.coords.longitude),
          lat: String(pos.coords.latitude)
        }),
        () => resolve(null),
        { enableHighAccuracy: false, timeout: 1500, maximumAge: 30 * 60 * 1000 }
      );
    });
  }

  async function fetchWeather(params) {
    const q = new URLSearchParams();
    if (params) {
      Object.keys(params).forEach((k) => {
        if (k === 'compact') return;
        if (params[k] != null && params[k] !== '') q.set(k, params[k]);
      });
    }
    const url = q.toString() ? API + '?' + q.toString() : API;
    const res = await fetch(url, { credentials: 'include' }).then((r) => r.json());
    if (!res || res.code !== 1) throw new Error((res && res.msg) || '天气加载失败');
    return res.content || {};
  }

  function formatObsTime(obsTime) {
    if (!obsTime) return '';
    try {
      const d = new Date(obsTime);
      if (isNaN(d.getTime())) return obsTime;
      const pad = (n) => String(n).padStart(2, '0');
      return `${d.getMonth() + 1}/${d.getDate()} ${pad(d.getHours())}:${pad(d.getMinutes())} 更新`;
    } catch (_) {
      return obsTime;
    }
  }

  function renderCompact(data) {
    const now = data.now || {};
    const city = shortCity(data);
    const temp = now.temp != null && now.temp !== '' ? now.temp + '℃' : '--';
    const text = now.text || '';
    const label = [city, text, temp].filter(Boolean).join(' ');
    return `
      <button type="button" class="weather-chip" role="region" aria-label="${esc(label)}" title="${esc(label)}" data-weather-refresh>
        <span class="wc-city">${esc(city)}</span>
        ${weatherIconSvg(text)}
        <span class="wc-temp">${esc(temp)}</span>
      </button>`;
  }

  function renderCard(data) {
    const now = data.now || {};
    const today = data.today || {};
    const tips = Array.isArray(data.tips) ? data.tips : [];
    const city = data.cityName || '当前城市';
    const adm1 = data.adm1 || '';
    const adm2 = data.adm2 || '';
    const temp = now.temp != null && now.temp !== '' ? now.temp + '°' : '--';
    const text = now.text || '--';
    const feels = now.feelsLike != null && now.feelsLike !== '' ? now.feelsLike + '°' : '--';
    const humidity = now.humidity != null && now.humidity !== '' ? now.humidity + '%' : '--';
    const wind = [now.windDir, now.windScale ? now.windScale + '级' : ''].filter(Boolean).join(' ') || '--';
    let aqi = '--';
    if (data.aqiAvailable && data.aqi != null && data.aqi >= 0) {
      aqi = data.aqi + (data.aqiCategory ? ' · ' + data.aqiCategory : '');
    } else {
      aqi = '暂未开通';
    }
    const range = (today.tempMin != null || today.tempMax != null)
      ? `${today.tempMin || '--'}° / ${today.tempMax || '--'}°`
      : '';
    let titlePlace = data.placeName || '';
    if (!titlePlace) {
      const parts = [];
      if (adm1) parts.push(adm1);
      if (adm2 && adm2 !== adm1 && adm2 !== city) {
        parts.push(/[市州盟]$/.test(adm2) ? adm2 : adm2 + '市');
      }
      if (city) parts.push(city);
      titlePlace = parts.join('·') || '当前城市';
    }

    return `
      <div class="weather-widget" role="region" aria-label="实时天气">
        <div class="ww-top">
          <div>
            <h3 class="ww-city">${esc(titlePlace)}</h3>
            <div class="ww-meta">今日实时天气</div>
          </div>
          <div class="ww-now">
            <span class="ww-temp">${esc(temp)}</span>
            <div>
              <div class="ww-text">${esc(text)}</div>
              ${range ? `<div class="ww-range">今日 ${esc(range)}</div>` : ''}
            </div>
          </div>
        </div>
        <div class="ww-grid">
          <div class="ww-item"><b>体感</b>${esc(feels)}</div>
          <div class="ww-item"><b>湿度</b>${esc(humidity)}</div>
          <div class="ww-item"><b>风力</b>${esc(wind)}</div>
          <div class="ww-item"><b>空气质量</b>${esc(aqi)}</div>
        </div>
        <div class="ww-tips">
          ${tips.map((t) => `<span class="ww-tip">${esc(t)}</span>`).join('') || '<span class="ww-tip">暂无特别提醒</span>'}
        </div>
        <div class="ww-foot">
          <span>${esc(formatObsTime(data.updateTime || now.obsTime))}</span>
          <button type="button" class="ww-refresh" data-weather-refresh>刷新</button>
        </div>
      </div>`;
  }

  async function loadInto(el, options) {
    // 默认紧凑小组件；仅显式 compact:false 时用大卡片
    const compact = !(options && options.compact === false);
    const loadingClass = compact ? 'weather-chip ww-loading' : 'weather-widget ww-loading';
    const errorClass = compact ? 'weather-chip ww-error' : 'weather-widget ww-error';
    el.innerHTML = `<div class="${loadingClass}">${compact ? '…' : '正在获取当前城市天气…'}</div>`;
    try {
      let params = Object.assign({}, options || {});
      // 紧凑模式：先出默认城市天气，定位成功后再静默刷新，避免卡首屏
      if (!params.locationId && !params.city && !(params.lon && params.lat)) {
        if (compact) {
          const data = await fetchWeather(params);
          el.innerHTML = renderCompact(data);
          const btn = el.querySelector('[data-weather-refresh]');
          if (btn) btn.onclick = () => loadInto(el, params);
          getPosition().then((pos) => {
            if (!pos) return;
            const next = Object.assign({}, params, pos);
            fetchWeather(next).then((d2) => {
              el.innerHTML = renderCompact(d2);
              const b2 = el.querySelector('[data-weather-refresh]');
              if (b2) b2.onclick = () => loadInto(el, next);
            }).catch(() => {});
          });
          return data;
        }
        const pos = await getPosition();
        if (pos) {
          params.lon = pos.lon;
          params.lat = pos.lat;
        }
      }
      const data = await fetchWeather(params);
      el.innerHTML = compact ? renderCompact(data) : renderCard(data);
      const btn = el.querySelector('[data-weather-refresh]');
      if (btn) {
        btn.onclick = () => loadInto(el, params);
      }
      return data;
    } catch (e) {
      el.innerHTML = `<div class="${errorClass}">${compact ? '天气暂不可用' : '天气暂不可用，请稍后刷新'}</div>`;
      return null;
    }
  }

  async function mount(target, options) {
    ensureStyles();
    const el = typeof target === 'string' ? document.querySelector(target) : target;
    if (!el) return null;

    const prev = timers.get(el);
    if (prev) clearInterval(prev);

    const data = await loadInto(el, options);
    const timer = setInterval(() => loadInto(el, options), REFRESH_MS);
    timers.set(el, timer);
    return data;
  }

  global.WeatherTips = { mount, fetchWeather };
})(window);
