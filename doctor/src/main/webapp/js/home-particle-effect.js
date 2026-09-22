import * as THREE from "https://cdn.jsdelivr.net/npm/three@0.160.0/build/three.module.js";
import { VERTEX_SHADER, FRAGMENT_SHADER } from "./_particle-shaders.js";

/**
 * 首页粒子心脏：效果图解剖心 + 原医疗科技背景装饰（环/网格/心电图/扫描线）
 */
(() => {
  const canvas = document.getElementById("med-three-canvas");
  if (!canvas) return;

  ["med-ecg-overlay", "med-bg-float", "med-bg-grid", "med-bg-glow", "med-particle-halo"].forEach((id) => {
    const el = document.getElementById(id);
    if (el) el.remove();
  });

  const CONFIG = {
    particleCount: 90000,
    particleSize: 110,
    heartScale: 45.6 * 0.82, // 再缩小
    beatBpm: 66,
    effectMode: 4,
    imageUrl: new URL("../images/heart-particle-ref.png", import.meta.url).href,
  };

  const PARTICLE_COUNT = CONFIG.particleCount;
  const beatHz = CONFIG.beatBpm / 60;
  const shaderTimeScale = CONFIG.beatBpm / 63;

  const renderer = new THREE.WebGLRenderer({
    canvas,
    antialias: true,
    alpha: true,
    powerPreference: "high-performance",
  });
  renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, 2));
  renderer.setClearColor(0x000000, 0);

  const scene = new THREE.Scene();
  scene.fog = new THREE.FogExp2(0x060812, 0.012);

  const camera = new THREE.PerspectiveCamera(35, 1, 0.1, 1000);
  camera.position.set(0, 0, 45);

  const deco = new THREE.Group();
  scene.add(deco);

  // —— 解剖心脏粒子 ——
  const geometry = new THREE.BufferGeometry();
  const positions = new Float32Array(PARTICLE_COUNT * 3);
  const targetPositions = new Float32Array(PARTICLE_COUNT * 3);
  const colors = new Float32Array(PARTICLE_COUNT * 3);
  const targetColors = new Float32Array(PARTICLE_COUNT * 3);
  const randomOffsets = new Float32Array(PARTICLE_COUNT * 3);

  const seedGreen = new THREE.Color(0x4ecdc4);
  const seedWhite = new THREE.Color(0x7ee8e0);

  for (let i = 0; i < PARTICLE_COUNT; i++) {
    const i3 = i * 3;
    const t = (Math.random() - 0.5) * 5.0;
    const angle = Math.random() * Math.PI * 2;
    const radiusBase = 0.4 + Math.pow(Math.abs(t), 2.4);
    const radius = radiusBase * (0.75 + Math.random() * 0.55);
    const x = radius * Math.cos(angle) * 2.9;
    const z = radius * Math.sin(angle) * 2.9;
    const y = t * 7.5;
    positions[i3] = x;
    positions[i3 + 1] = y;
    positions[i3 + 2] = z;
    targetPositions[i3] = x;
    targetPositions[i3 + 1] = y;
    targetPositions[i3 + 2] = z;
    randomOffsets[i3] = (Math.random() - 0.5) * 2;
    randomOffsets[i3 + 1] = (Math.random() - 0.5) * 2;
    randomOffsets[i3 + 2] = (Math.random() - 0.5) * 2;
    const c = Math.random() > 0.7 ? seedGreen : seedWhite;
    colors[i3] = c.r;
    colors[i3 + 1] = c.g;
    colors[i3 + 2] = c.b;
    targetColors[i3] = c.r;
    targetColors[i3 + 1] = c.g;
    targetColors[i3 + 2] = c.b;
  }

  geometry.setAttribute("position", new THREE.BufferAttribute(positions, 3));
  geometry.setAttribute("targetPosition", new THREE.BufferAttribute(targetPositions, 3));
  geometry.setAttribute("color", new THREE.BufferAttribute(colors, 3));
  geometry.setAttribute("targetColor", new THREE.BufferAttribute(targetColors, 3));
  geometry.setAttribute("randomOffset", new THREE.BufferAttribute(randomOffsets, 3));

  const material = new THREE.ShaderMaterial({
    vertexShader: VERTEX_SHADER,
    fragmentShader: FRAGMENT_SHADER,
    transparent: true,
    depthWrite: false,
    blending: THREE.AdditiveBlending,
    uniforms: {
      uTime: { value: 0 },
      uMorph: { value: 0 },
      uPointSize: { value: CONFIG.particleSize },
      uEffectMode: { value: CONFIG.effectMode },
      uEffectIntensity: { value: 1 },
      uExplosionTime: { value: 0 },
    },
  });

  const points = new THREE.Points(geometry, material);
  deco.add(points);

  // —— 背景装饰：环 / 网格 / 扫描线 / 漂浮点（不含数学心形）——
  const ringMat = new THREE.LineBasicMaterial({ color: 0x4ecdc4, transparent: true, opacity: 0.22 });
  const makeRing = (r, y, rot) => {
    const curve = new THREE.EllipseCurve(0, 0, r, r * 0.42, 0, Math.PI * 2);
    const pts = curve.getPoints(180).map((p) => new THREE.Vector3(p.x, y, p.y));
    const line = new THREE.LineLoop(new THREE.BufferGeometry().setFromPoints(pts), ringMat.clone());
    line.rotation.x = rot;
    deco.add(line);
    return line;
  };
  const rings = [makeRing(13, -0.4, 1.25), makeRing(10, 0.3, -0.95), makeRing(16.5, 0.6, 0.52)];

  const grid = new THREE.GridHelper(70, 48, 0x2c7be5, 0x2c7be5);
  grid.material.transparent = true;
  grid.material.opacity = 0.08;
  grid.position.set(0, -14, -8);
  deco.add(grid);

  // —— 真实风格心电图（P-QRS-T），向右无限滚动 ——
  const lineMat = new THREE.LineBasicMaterial({
    color: 0x4ecdc4,
    transparent: true,
    opacity: 0.92,
    blending: THREE.AdditiveBlending,
    depthWrite: false,
  });
  const glowMat = new THREE.LineBasicMaterial({
    color: 0x2c7be5,
    transparent: true,
    opacity: 0.28,
    blending: THREE.AdditiveBlending,
    depthWrite: false,
  });
  const baseMat = new THREE.LineBasicMaterial({
    color: 0x4ecdc4,
    transparent: true,
    opacity: 0.14,
    depthWrite: false,
  });

  const ECG_SEGMENTS = 720;
  const ECG_WIDTH = 56;
  const ECG_Y = -11.5;
  const cyclesOnScreen = 3.2;

  const gauss = (x, mu, sigma) => {
    const d = (x - mu) / sigma;
    return Math.exp(-0.5 * d * d);
  };

  // 近似 II 导联：小 P → 窄 QRS → 宽 T，大部分为等电位线
  const ecgWave = (t) => {
    const x = ((t % 1) + 1) % 1;
    let y = 0;
    y += 0.28 * gauss(x, 0.14, 0.016); // P
    y -= 0.22 * gauss(x, 0.295, 0.006); // Q
    y += 1.85 * gauss(x, 0.318, 0.0055); // R
    y -= 0.55 * gauss(x, 0.345, 0.008); // S
    y += 0.48 * gauss(x, 0.52, 0.032); // T
    y += 0.06 * gauss(x, 0.7, 0.028); // U（轻微）
    return y;
  };

  const ecgPositions = new Float32Array(ECG_SEGMENTS * 3);
  const glowPositions = new Float32Array(ECG_SEGMENTS * 3);
  for (let i = 0; i < ECG_SEGMENTS; i++) {
    const u = i / (ECG_SEGMENTS - 1);
    const x = (u - 0.5) * ECG_WIDTH;
    ecgPositions[i * 3] = x;
    ecgPositions[i * 3 + 1] = ECG_Y;
    ecgPositions[i * 3 + 2] = -2;
    glowPositions[i * 3] = x;
    glowPositions[i * 3 + 1] = ECG_Y;
    glowPositions[i * 3 + 2] = -2.05;
  }
  const ecgGeo = new THREE.BufferGeometry();
  ecgGeo.setAttribute("position", new THREE.BufferAttribute(ecgPositions, 3));
  const glowGeo = new THREE.BufferGeometry();
  glowGeo.setAttribute("position", new THREE.BufferAttribute(glowPositions, 3));
  const ecgLine = new THREE.Line(ecgGeo, lineMat);
  const ecgGlow = new THREE.Line(glowGeo, glowMat);
  deco.add(ecgGlow);
  deco.add(ecgLine);

  const baseline = new THREE.Line(
    new THREE.BufferGeometry().setFromPoints([
      new THREE.Vector3(-ECG_WIDTH * 0.5, ECG_Y, -2.2),
      new THREE.Vector3(ECG_WIDTH * 0.5, ECG_Y, -2.2),
    ]),
    baseMat
  );
  deco.add(baseline);

  const scanGeo = new THREE.PlaneGeometry(48, 0.12);
  const scanMat = new THREE.MeshBasicMaterial({
    color: 0x4ecdc4,
    transparent: true,
    opacity: 0.28,
    blending: THREE.AdditiveBlending,
    depthWrite: false,
  });
  const scanLine = new THREE.Mesh(scanGeo, scanMat);
  scanLine.position.set(0, -10, 2);
  scanLine.rotation.x = -0.55;
  deco.add(scanLine);

  const dataGeo = new THREE.BufferGeometry();
  const dataCount = 160;
  const dataPos = new Float32Array(dataCount * 3);
  for (let i = 0; i < dataCount; i++) {
    dataPos[i * 3] = (Math.random() - 0.5) * 55;
    dataPos[i * 3 + 1] = (Math.random() - 0.5) * 36;
    dataPos[i * 3 + 2] = (Math.random() - 0.5) * 18;
  }
  dataGeo.setAttribute("position", new THREE.BufferAttribute(dataPos, 3));
  const dataPts = new THREE.Points(
    dataGeo,
    new THREE.PointsMaterial({
      size: 0.14,
      color: 0x7ee8e0,
      transparent: true,
      opacity: 0.45,
      blending: THREE.AdditiveBlending,
      depthWrite: false,
    })
  );
  deco.add(dataPts);

  let imageReady = false;
  let morphFactor = 0;
  let clickBoost = 0;

  const applyHeartSamples = (validPoints) => {
    const scale = CONFIG.heartScale / 38;
    for (let i = 0; i < PARTICLE_COUNT; i++) {
      const i3 = i * 3;
      const point = validPoints[i % validPoints.length];
      const dust = Math.random() < 0.12;
      const jitter = dust ? 2.8 : 0.35;
      const spreadZ = dust ? 4.5 : 1.5;
      targetPositions[i3] = point.pos[0] * scale + (Math.random() - 0.5) * jitter;
      targetPositions[i3 + 1] = point.pos[1] * scale + (Math.random() - 0.5) * jitter;
      targetPositions[i3 + 2] = point.pos[2] * scale + (Math.random() - 0.5) * spreadZ;
      const dim = dust ? 0.55 : 1;
      targetColors[i3] = point.col[0] * dim;
      targetColors[i3 + 1] = point.col[1] * dim;
      targetColors[i3 + 2] = point.col[2] * dim;
    }
    geometry.attributes.targetPosition.needsUpdate = true;
    geometry.attributes.targetColor.needsUpdate = true;
    imageReady = true;
  };

  const fallbackHeart = () => {
    const pts = [];
    for (let i = 0; i < 8000; i++) {
      const t = Math.random() * Math.PI * 2;
      const u = Math.random() * Math.PI * 2;
      const v = Math.random() * Math.PI;
      const s = 18;
      const hx = 16 * Math.pow(Math.sin(t), 3);
      const hy = 13 * Math.cos(t) - 5 * Math.cos(2 * t) - 2 * Math.cos(3 * t) - Math.cos(4 * t);
      const x = ((s * hx) / 16) * Math.sin(v) * Math.cos(u);
      const y = (s * hy) / 16;
      const z = ((s * hx) / 16) * Math.sin(v) * Math.sin(u) * 0.8;
      const bright = Math.random();
      let col;
      if (bright > 0.92) col = [0.2, 1, 0.55];
      else if (bright > 0.7) col = [1, 1, 1];
      else col = [0.55 + Math.random() * 0.25, 0.08, 0.12];
      pts.push({ pos: [x, y, z], col });
    }
    applyHeartSamples(pts);
  };

  const processImage = (imageUrl) => {
    const img = new Image();
    img.crossOrigin = "anonymous";
    img.onload = () => {
      const off = document.createElement("canvas");
      const ctx = off.getContext("2d");
      const resolution = 220;
      const aspect = img.width / img.height;
      const drawWidth = aspect > 1 ? resolution : resolution * aspect;
      const drawHeight = aspect > 1 ? resolution / aspect : resolution;
      off.width = resolution;
      off.height = resolution;
      ctx.fillStyle = "black";
      ctx.fillRect(0, 0, resolution, resolution);
      ctx.drawImage(img, (resolution - drawWidth) / 2, (resolution - drawHeight) / 2, drawWidth, drawHeight);
      const imgData = ctx.getImageData(0, 0, resolution, resolution).data;
      const validPoints = [];
      for (let y = 0; y < resolution; y++) {
        for (let x = 0; x < resolution; x++) {
          const idx = (y * resolution + x) * 4;
          const r = imgData[idx];
          const g = imgData[idx + 1];
          const b = imgData[idx + 2];
          const a = imgData[idx + 3];
          if (a < 20) continue;
          const lum = (r + g + b) / 3;
          if (lum <= 12) continue;
          validPoints.push({
            pos: [(x / resolution - 0.5) * 38, (0.5 - y / resolution) * 38, (lum / 255 - 0.5) * 12],
            col: [r / 255, g / 255, b / 255],
          });
        }
      }
      if (validPoints.length > 200) applyHeartSamples(validPoints);
      else fallbackHeart();
    };
    img.onerror = () => {
      console.warn("[home-particle] heart image load failed, using fallback shape", imageUrl);
      fallbackHeart();
    };
    img.src = imageUrl;
  };

  processImage(CONFIG.imageUrl);

  const layout = () => {
    const w = window.innerWidth;
    const h = window.innerHeight;
    renderer.setSize(w, h, false);
    camera.aspect = w / h;
    camera.updateProjectionMatrix();
    const offsetX = w < 900 ? 4 : w < 1200 ? 10 : 14;
    deco.position.set(offsetX, 1.2, 0);
    camera.lookAt(offsetX * 0.55, 0, 0);
  };
  window.addEventListener("resize", layout);
  layout();

  window.addEventListener("click", (event) => {
    if (event.clientX > window.innerWidth * 0.4) {
      clickBoost = 1;
      window.dispatchEvent(new CustomEvent("med-heart-pulse"));
    }
  });
  window.addEventListener("med-heart-pulse", () => {
    clickBoost = Math.max(clickBoost, 1);
  });

  let time = 0;
  const animate = () => {
    requestAnimationFrame(animate);
    time += 0.008;
    clickBoost *= 0.92;

    const targetMorph = imageReady ? 1 : 0;
    morphFactor += (targetMorph - morphFactor) * 0.045;
    material.uniforms.uMorph.value = morphFactor;
    material.uniforms.uTime.value = time * shaderTimeScale;
    material.uniforms.uEffectIntensity.value = 0.85 + clickBoost * 0.55;

    const beatPulse = Math.pow(Math.max(0, Math.sin(time * Math.PI * 2 * beatHz)), 6);

    if (imageReady) {
      points.rotation.y = Math.sin(time * 0.35) * 0.12;
      points.rotation.x = Math.sin(time * 0.22) * 0.04;
    }

    rings.forEach((ring, index) => {
      ring.rotation.z += 0.0028 + index * 0.001;
      ring.material.opacity = 0.16 + beatPulse * 0.24;
    });

    // 心电图：真实 P-QRS-T，向右无限滚动（比心跳略慢）
    const scroll = time * beatHz * 0.55;
    const arr = ecgGeo.attributes.position.array;
    const glowArr = glowGeo.attributes.position.array;
    for (let i = 0; i < ECG_SEGMENTS; i++) {
      const i3 = i * 3;
      const u = i / (ECG_SEGMENTS - 1);
      // 减 scroll → 波形向右推进
      const phase = (((u * cyclesOnScreen - scroll) % 1) + 1) % 1;
      const y = ECG_Y + ecgWave(phase) * 1.15;
      const x = (u - 0.5) * ECG_WIDTH;
      arr[i3] = x;
      arr[i3 + 1] = y;
      arr[i3 + 2] = -2;
      glowArr[i3] = x;
      glowArr[i3 + 1] = y;
      glowArr[i3 + 2] = -2.05;
    }
    ecgGeo.attributes.position.needsUpdate = true;
    glowGeo.attributes.position.needsUpdate = true;
    lineMat.opacity = 0.78 + beatPulse * 0.18 + clickBoost * 0.12;
    glowMat.opacity = 0.22 + beatPulse * 0.12;

    const scanY = -16 + ((time * 3.2) % 22);
    scanLine.position.y = scanY;
    scanMat.opacity = 0.18 + beatPulse * 0.22;

    dataPts.rotation.y = time * 0.06;
    dataPts.position.y = Math.sin(time * 0.35) * 0.4;
    grid.position.z = -8 + Math.sin(time * 0.5) * 0.8;

    renderer.render(scene, camera);
  };
  animate();
})();
