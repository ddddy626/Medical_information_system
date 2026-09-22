/**
 * UI 增强：轻量 Border Glow + 统计数字 Count Up（避免 MutationObserver 反馈环）
 */
(function (global) {
  let glowRaf = 0;
  let glowTarget = null;
  let glowX = 50;
  let glowY = 50;

  function flushGlow() {
    glowRaf = 0;
    if (!glowTarget) return;
    glowTarget.style.setProperty('--glow-x', glowX.toFixed(1) + '%');
    glowTarget.style.setProperty('--glow-y', glowY.toFixed(1) + '%');
  }

  function bindBorderGlow(root) {
    const scope = root || document;
    const cards = scope.querySelectorAll(
      '.stat-card, .action-card, .home-feature-card, .dash-stat, .dash-kpi, .dash-alert-card, .dash-quick-btn'
    );
    cards.forEach((el) => {
      if (el.dataset.glowBound) return;
      el.dataset.glowBound = '1';
      el.classList.add('border-glow');
      el.addEventListener('pointermove', (e) => {
        const rect = el.getBoundingClientRect();
        glowTarget = el;
        glowX = ((e.clientX - rect.left) / Math.max(rect.width, 1)) * 100;
        glowY = ((e.clientY - rect.top) / Math.max(rect.height, 1)) * 100;
        if (!glowRaf) glowRaf = requestAnimationFrame(flushGlow);
      }, { passive: true });
    });
  }

  function animateCount(el, end, duration) {
    const target = Number(end);
    if (!isFinite(target)) {
      el.textContent = end;
      return;
    }
    if (el._countRaf) {
      cancelAnimationFrame(el._countRaf);
      el._countRaf = 0;
    }
    el.dataset.counting = '1';
    const start = Number(el.dataset.countLast || 0) || 0;
    const t0 = performance.now();
    const dur = duration || 600;
    const step = (now) => {
      const t = Math.min(1, (now - t0) / dur);
      const eased = 1 - Math.pow(1 - t, 3);
      el.textContent = String(Math.round(start + (target - start) * eased));
      if (t < 1) {
        el._countRaf = requestAnimationFrame(step);
      } else {
        el._countRaf = 0;
        el.textContent = String(Math.round(target));
        el.dataset.countLast = String(Math.round(target));
        el.dataset.counting = '0';
      }
    };
    el._countRaf = requestAnimationFrame(step);
  }

  function bindCounters(root) {
    const scope = root || document;
    scope.querySelectorAll('.stat-value, .dash-stat b, .dash-kpi-meta b').forEach((el) => {
      const raw = String(el.textContent || '').trim();
      if (!/^\d+(\.\d+)?$/.test(raw)) return;
      const n = Number(raw);
      const prev = el.dataset.countLast;
      // 仅当数值变化且未在动画中时启动，避免重复 enhance / 反馈环
      if (el.dataset.counting === '1') return;
      if (prev != null && prev === String(Math.round(n))) return;
      if (n === 0 && (prev == null || prev === '0')) {
        el.dataset.countLast = '0';
        return;
      }
      animateCount(el, n, 600);
    });
  }

  function enhance(root) {
    bindBorderGlow(root);
    bindCounters(root);
  }

  // 不在脚本加载时立刻全页扫描，由页面在数据就绪后调用，减少首屏争抢
  global.UiEnhance = { enhance, bindBorderGlow, bindCounters, animateCount };
})(window);
