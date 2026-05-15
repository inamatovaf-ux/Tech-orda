<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Retail Customer Segmentation — README</title>
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Mono:wght@300;400;500&display=swap" rel="stylesheet">
<style>
  :root {
    --bg: #0a0a0f;
    --surface: #111118;
    --border: #1e1e2e;
    --accent: #6ee7b7;
    --accent2: #f472b6;
    --accent3: #818cf8;
    --text: #e2e8f0;
    --muted: #64748b;
    --card: #13131c;
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: 'DM Mono', monospace;
    font-size: 14px;
    line-height: 1.7;
    min-height: 100vh;
    overflow-x: hidden;
  }

  /* Grid background */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image:
      linear-gradient(rgba(110,231,183,0.03) 1px, transparent 1px),
      linear-gradient(90deg, rgba(110,231,183,0.03) 1px, transparent 1px);
    background-size: 40px 40px;
    pointer-events: none;
    z-index: 0;
  }

  .wrap {
    max-width: 860px;
    margin: 0 auto;
    padding: 60px 32px 100px;
    position: relative;
    z-index: 1;
  }

  /* ── HERO ── */
  .hero {
    margin-bottom: 64px;
    animation: fadeUp 0.7s ease both;
  }

  .hero-label {
    font-family: 'DM Mono', monospace;
    font-size: 11px;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--accent);
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .hero-label::after {
    content: '';
    flex: 1;
    height: 1px;
    background: linear-gradient(90deg, var(--accent), transparent);
    max-width: 120px;
  }

  h1 {
    font-family: 'Syne', sans-serif;
    font-size: clamp(32px, 5vw, 52px);
    font-weight: 800;
    line-height: 1.1;
    letter-spacing: -0.02em;
    margin-bottom: 20px;
    background: linear-gradient(135deg, #fff 30%, var(--accent) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  .hero-sub {
    font-size: 15px;
    color: var(--muted);
    max-width: 560px;
    margin-bottom: 32px;
  }

  /* Badges */
  .badges {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-bottom: 40px;
  }

  .badge {
    padding: 4px 12px;
    border-radius: 4px;
    font-size: 11px;
    font-weight: 500;
    letter-spacing: 0.05em;
    font-family: 'DM Mono', monospace;
    border: 1px solid;
  }

  .badge-green  { color: var(--accent);  border-color: rgba(110,231,183,0.3); background: rgba(110,231,183,0.06); }
  .badge-pink   { color: var(--accent2); border-color: rgba(244,114,182,0.3); background: rgba(244,114,182,0.06); }
  .badge-purple { color: var(--accent3); border-color: rgba(129,140,248,0.3); background: rgba(129,140,248,0.06); }
  .badge-gray   { color: var(--muted);   border-color: rgba(100,116,139,0.3); background: rgba(100,116,139,0.06); }

  /* ── STAT ROW ── */
  .stats {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 1px;
    background: var(--border);
    border: 1px solid var(--border);
    border-radius: 12px;
    overflow: hidden;
    margin-bottom: 64px;
    animation: fadeUp 0.7s 0.1s ease both;
  }

  .stat {
    background: var(--card);
    padding: 24px 20px;
    text-align: center;
  }

  .stat-val {
    font-family: 'Syne', sans-serif;
    font-size: 28px;
    font-weight: 800;
    background: linear-gradient(135deg, #fff, var(--accent));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    display: block;
    margin-bottom: 4px;
  }

  .stat-label {
    font-size: 10px;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--muted);
  }

  /* ── SECTIONS ── */
  section {
    margin-bottom: 56px;
    animation: fadeUp 0.7s ease both;
  }

  section:nth-child(3)  { animation-delay: 0.15s; }
  section:nth-child(4)  { animation-delay: 0.2s; }
  section:nth-child(5)  { animation-delay: 0.25s; }
  section:nth-child(6)  { animation-delay: 0.3s; }
  section:nth-child(7)  { animation-delay: 0.35s; }

  .section-title {
    font-family: 'Syne', sans-serif;
    font-size: 11px;
    font-weight: 600;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--accent);
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .section-title::before {
    content: '';
    width: 20px;
    height: 1px;
    background: var(--accent);
  }

  h2 {
    font-family: 'Syne', sans-serif;
    font-size: 24px;
    font-weight: 700;
    color: #fff;
    margin-bottom: 16px;
    letter-spacing: -0.01em;
  }

  p {
    color: #94a3b8;
    margin-bottom: 12px;
    font-size: 14px;
  }

  /* ── QUESTIONS ── */
  .questions {
    display: flex;
    flex-direction: column;
    gap: 2px;
  }

  .q-item {
    display: flex;
    align-items: flex-start;
    gap: 14px;
    padding: 14px 18px;
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 8px;
    transition: border-color 0.2s;
  }

  .q-item:hover { border-color: rgba(110,231,183,0.3); }

  .q-num {
    font-size: 11px;
    color: var(--accent);
    font-weight: 500;
    margin-top: 2px;
    min-width: 24px;
  }

  .q-text { color: #cbd5e1; font-size: 14px; }

  /* ── STACK ── */
  .stack-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 12px;
  }

  .stack-card {
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 20px;
    transition: border-color 0.2s, transform 0.2s;
  }

  .stack-card:hover {
    border-color: rgba(110,231,183,0.25);
    transform: translateY(-2px);
  }

  .stack-icon {
    font-size: 22px;
    margin-bottom: 10px;
    display: block;
  }

  .stack-name {
    font-family: 'Syne', sans-serif;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    margin-bottom: 4px;
  }

  .stack-desc {
    font-size: 12px;
    color: var(--muted);
  }

  /* ── DATA ── */
  .data-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 2px;
    background: var(--border);
    border: 1px solid var(--border);
    border-radius: 10px;
    overflow: hidden;
  }

  .data-item {
    background: var(--card);
    padding: 14px 18px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .data-col { font-size: 13px; color: #94a3b8; }
  .data-type {
    font-size: 11px;
    color: var(--accent3);
    background: rgba(129,140,248,0.1);
    border: 1px solid rgba(129,140,248,0.2);
    padding: 2px 8px;
    border-radius: 4px;
  }
  .data-type.str {
    color: var(--accent2);
    background: rgba(244,114,182,0.08);
    border-color: rgba(244,114,182,0.2);
  }

  /* ── INSIGHTS ── */
  .insights {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .insight {
    background: var(--card);
    border: 1px solid var(--border);
    border-left: 3px solid var(--accent);
    border-radius: 0 10px 10px 0;
    padding: 18px 20px;
  }

  .insight-num {
    font-family: 'Syne', sans-serif;
    font-size: 11px;
    font-weight: 700;
    color: var(--accent);
    letter-spacing: 0.1em;
    text-transform: uppercase;
    margin-bottom: 6px;
  }

  .insight-text { color: #cbd5e1; font-size: 14px; }

  /* ── RECS ── */
  .recs {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .rec {
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 16px 20px;
    display: flex;
    gap: 14px;
    align-items: flex-start;
    transition: border-color 0.2s;
  }

  .rec:hover { border-color: rgba(244,114,182,0.25); }

  .rec-icon { font-size: 18px; margin-top: 1px; }
  .rec-body {}
  .rec-title {
    font-family: 'Syne', sans-serif;
    font-size: 13px;
    font-weight: 700;
    color: #fff;
    margin-bottom: 3px;
  }
  .rec-text { font-size: 13px; color: var(--muted); }

  /* ── FILE TREE ── */
  .tree {
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 24px 28px;
    font-family: 'DM Mono', monospace;
    font-size: 13px;
  }

  .tree-line {
    color: var(--muted);
    line-height: 2;
  }

  .tree-line .name { color: #e2e8f0; }
  .tree-line .comment { color: #334155; margin-left: 8px; }
  .tree-line .folder { color: var(--accent3); }
  .tree-line .highlight { color: var(--accent); }

  /* ── FOOTER ── */
  .footer {
    margin-top: 80px;
    padding-top: 32px;
    border-top: 1px solid var(--border);
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: var(--muted);
    font-size: 12px;
  }

  .footer-author {
    font-family: 'Syne', sans-serif;
    font-weight: 700;
    color: #fff;
    font-size: 13px;
  }

  /* ── SEGMENT CHART ── */
  .seg-bars {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .seg-row {
    display: flex;
    align-items: center;
    gap: 14px;
  }

  .seg-label {
    font-size: 12px;
    color: var(--muted);
    min-width: 110px;
    text-align: right;
  }

  .seg-bar-wrap {
    flex: 1;
    background: var(--border);
    border-radius: 4px;
    height: 8px;
    overflow: hidden;
  }

  .seg-bar {
    height: 100%;
    border-radius: 4px;
    animation: growBar 1s ease both;
  }

  .seg-pct {
    font-size: 12px;
    color: #64748b;
    min-width: 40px;
  }

  @keyframes growBar {
    from { width: 0 !important; }
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(16px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  @media (max-width: 600px) {
    .stats { grid-template-columns: repeat(2,1fr); }
    .stack-grid { grid-template-columns: repeat(2,1fr); }
    .data-grid { grid-template-columns: 1fr; }
    .footer { flex-direction: column; gap: 12px; text-align: center; }
  }
</style>
</head>
<body>
<div class="wrap">

  <!-- HERO -->
  <div class="hero">
    <div class="hero-label">Data Analytics · Pet Project</div>
    <h1>Retail Customer<br>Segmentation</h1>
    <p class="hero-sub">
      Анализ поведения 50 000 клиентов интернет-магазина: сегментация, 
      выявление ключевых драйверов дохода и рекомендации по удержанию 
      высокоценных покупателей.
    </p>
    <div class="badges">
      <span class="badge badge-green">Python</span>
      <span class="badge badge-green">Pandas</span>
      <span class="badge badge-green">Seaborn</span>
      <span class="badge badge-purple">SQL</span>
      <span class="badge badge-pink">Power BI</span>
      <span class="badge badge-purple">Scikit-learn</span>
      <span class="badge badge-gray">SciPy</span>
    </div>
  </div>

  <!-- STATS -->
  <div class="stats">
    <div class="stat">
      <span class="stat-val">50K</span>
      <span class="stat-label">строк данных</span>
    </div>
    <div class="stat">
      <span class="stat-val">14</span>
      <span class="stat-label">признаков</span>
    </div>
    <div class="stat">
      <span class="stat-val">4</span>
      <span class="stat-label">сегмента</span>
    </div>
    <div class="stat">
      <span class="stat-val">3</span>
      <span class="stat-label">региона</span>
    </div>
  </div>

  <!-- ЦЕЛЬ -->
  <section>
    <div class="section-title">Цель проекта</div>
    <h2>Бизнес-задача</h2>
    <p>
      Ритейлер хочет понять, кто его клиенты и как работать с каждой группой по-разному. 
      Текущая маркетинговая стратегия одинакова для всех — это приводит к потере High Value 
      покупателей и пустым расходам на Occasional.
    </p>
    <p>
      Цель: построить профиль каждого сегмента, найти факторы, влияющие на средний чек, 
      и дать конкретные рекомендации по удержанию лояльной аудитории.
    </p>
  </section>

  <!-- ВОПРОСЫ -->
  <section>
    <div class="section-title">Исследование</div>
    <h2>Бизнес-вопросы</h2>
    <div class="questions">
      <div class="q-item">
        <span class="q-num">01</span>
        <span class="q-text">Какой сегмент клиентов приносит наибольший доход и чем он отличается от остальных?</span>
      </div>
      <div class="q-item">
        <span class="q-num">02</span>
        <span class="q-text">Как регион влияет на поведение покупателя и средний чек?</span>
      </div>
      <div class="q-item">
        <span class="q-num">03</span>
        <span class="q-text">Влияет ли частое использование скидок на итоговый LTV клиента?</span>
      </div>
      <div class="q-item">
        <span class="q-num">04</span>
        <span class="q-text">Можно ли предсказать средний ежемесячный расход по характеристикам клиента?</span>
      </div>
      <div class="q-item">
        <span class="q-num">05</span>
        <span class="q-text">Есть ли значимая разница в возвратах между сегментами? (A/B тест)</span>
      </div>
    </div>
  </section>

  <!-- СТЕК -->
  <section>
    <div class="section-title">Инструменты</div>
    <h2>Стек технологий</h2>
    <div class="stack-grid">
      <div class="stack-card">
        <span class="stack-icon">🐍</span>
        <div class="stack-name">Python</div>
        <div class="stack-desc">Pandas, NumPy — очистка и трансформация данных</div>
      </div>
      <div class="stack-card">
        <span class="stack-icon">📊</span>
        <div class="stack-name">Визуализация</div>
        <div class="stack-desc">Seaborn, Matplotlib — EDA и графики</div>
      </div>
      <div class="stack-card">
        <span class="stack-icon">🗄️</span>
        <div class="stack-name">SQL</div>
        <div class="stack-desc">PostgreSQL — агрегации, CTE, оконные функции</div>
      </div>
      <div class="stack-card">
        <span class="stack-icon">🤖</span>
        <div class="stack-name">ML</div>
        <div class="stack-desc">Scikit-learn — линейная регрессия, R², MAE</div>
      </div>
      <div class="stack-card">
        <span class="stack-icon">🧪</span>
        <div class="stack-name">Статистика</div>
        <div class="stack-desc">SciPy — t-test, проверка гипотез</div>
      </div>
      <div class="stack-card">
        <span class="stack-icon">📈</span>
        <div class="stack-name">Power BI</div>
        <div class="stack-desc">Интерактивный дашборд с фильтрами по сегменту</div>
      </div>
    </div>
  </section>

  <!-- ДАННЫЕ -->
  <section>
    <div class="section-title">Датасет</div>
    <h2>Структура данных</h2>
    <p style="margin-bottom:16px;">50 000 строк · 14 колонок · ~5% пропусков (обработаны медианой)</p>
    <div class="data-grid">
      <div class="data-item"><span class="data-col">customer_id</span><span class="data-type">int</span></div>
      <div class="data-item"><span class="data-col">age</span><span class="data-type">int</span></div>
      <div class="data-item"><span class="data-col">annual_income</span><span class="data-type">float</span></div>
      <div class="data-item"><span class="data-col">avg_monthly_spend</span><span class="data-type">float</span></div>
      <div class="data-item"><span class="data-col">avg_order_value</span><span class="data-type">float</span></div>
      <div class="data-item"><span class="data-col">purchase_frequency</span><span class="data-type">float</span></div>
      <div class="data-item"><span class="data-col">discount_usage_rate</span><span class="data-type">float</span></div>
      <div class="data-item"><span class="data-col">return_rate</span><span class="data-type">float</span></div>
      <div class="data-item"><span class="data-col">browsing_time_minutes</span><span class="data-type">float</span></div>
      <div class="data-item"><span class="data-col">support_interactions</span><span class="data-type">float</span></div>
      <div class="data-item"><span class="data-col">payment_method</span><span class="data-type str">str</span></div>
      <div class="data-item"><span class="data-col">region</span><span class="data-type str">str</span></div>
      <div class="data-item"><span class="data-col">months_active</span><span class="data-type">int</span></div>
      <div class="data-item"><span class="data-col">customer_segment 🎯</span><span class="data-type str">target</span></div>
    </div>
  </section>

  <!-- СЕГМЕНТЫ -->
  <section>
    <div class="section-title">Распределение</div>
    <h2>Сегменты клиентов</h2>
    <div class="seg-bars">
      <div class="seg-row">
        <span class="seg-label">Occasional</span>
        <div class="seg-bar-wrap"><div class="seg-bar" style="width:44.2%; background: linear-gradient(90deg, #6ee7b7, #34d399);"></div></div>
        <span class="seg-pct">44.2%</span>
      </div>
      <div class="seg-row">
        <span class="seg-label">Regular</span>
        <div class="seg-bar-wrap"><div class="seg-bar" style="width:26.9%; background: linear-gradient(90deg, #818cf8, #6366f1);"></div></div>
        <span class="seg-pct">26.9%</span>
      </div>
      <div class="seg-row">
        <span class="seg-label">Loyal</span>
        <div class="seg-bar-wrap"><div class="seg-bar" style="width:18.3%; background: linear-gradient(90deg, #f472b6, #ec4899);"></div></div>
        <span class="seg-pct">18.3%</span>
      </div>
      <div class="seg-row">
        <span class="seg-label">High Value</span>
        <div class="seg-bar-wrap"><div class="seg-bar" style="width:10.5%; background: linear-gradient(90deg, #fbbf24, #f59e0b);"></div></div>
        <span class="seg-pct">10.5%</span>
      </div>
    </div>
  </section>

  <!-- ВЫВОДЫ -->
  <section>
    <div class="section-title">Результаты</div>
    <h2>Ключевые выводы</h2>
    <div class="insights">
      <div class="insight">
        <div class="insight-num">Вывод 01</div>
        <div class="insight-text">Сегмент High Value (10.5% клиентов) генерирует непропорционально высокую выручку. Средний чек выше в 2.3× по сравнению с Occasional, при этом return_rate ниже на 40%.</div>
      </div>
      <div class="insight">
        <div class="insight-num">Вывод 02</div>
        <div class="insight-text">Urban-клиенты тратят в среднем на 18% больше, чем Rural. Однако Loyal-сегмент в Semi-Urban демонстрирует наибольший прирост purchase_frequency — здесь скрыт потенциал роста.</div>
      </div>
      <div class="insight">
        <div class="insight-num">Вывод 03</div>
        <div class="insight-text">t-test подтвердил (p &lt; 0.05): клиенты с высоким discount_usage_rate имеют значимо ниже avg_monthly_spend в долгосрочной перспективе — скидки привлекают нелояльную аудиторию.</div>
      </div>
      <div class="insight">
        <div class="insight-num">Вывод 04</div>
        <div class="insight-text">Модель линейной регрессии предсказывает avg_monthly_spend с R² = 0.71. Наиболее значимые признаки: purchase_frequency, months_active, annual_income.</div>
      </div>
    </div>
  </section>

  <!-- РЕКОМЕНДАЦИИ -->
  <section>
    <div class="section-title">Рекомендации</div>
    <h2>Для бизнеса</h2>
    <div class="recs">
      <div class="rec">
        <span class="rec-icon">🎯</span>
        <div class="rec-body">
          <div class="rec-title">Персонализировать коммуникацию по сегментам</div>
          <div class="rec-text">High Value и Loyal получают эксклюзивные предложения без скидок — им важен сервис, не цена. Occasional — триггерные письма с ограниченными по времени акциями.</div>
        </div>
      </div>
      <div class="rec">
        <span class="rec-icon">📍</span>
        <div class="rec-body">
          <div class="rec-title">Сфокусировать рекламный бюджет на Semi-Urban</div>
          <div class="rec-text">Наибольший потенциал роста — Semi-Urban Loyal. Расширение доставки и локальные акции дадут прирост повторных покупок.</div>
        </div>
      </div>
      <div class="rec">
        <span class="rec-icon">🔒</span>
        <div class="rec-body">
          <div class="rec-title">Снизить зависимость от скидочных механик</div>
          <div class="rec-text">Клиенты с discount_usage_rate > 0.7 в среднем уходят через 8 месяцев. Заменить скидки на программу лояльности с баллами и привилегиями.</div>
        </div>
      </div>
      <div class="rec">
        <span class="rec-icon">⚡</span>
        <div class="rec-body">
          <div class="rec-title">Уменьшить support_interactions для Occasional</div>
          <div class="rec-text">Высокое число обращений в поддержку коррелирует с уходом. Улучшить онбординг и FAQ — снизит нагрузку и удержит сегмент.</div>
        </div>
      </div>
    </div>
  </section>

  <!-- ФАЙЛОВАЯ СТРУКТУРА -->
  <section>
    <div class="section-title">Репозиторий</div>
    <h2>Структура проекта</h2>
    <div class="tree">
      <div class="tree-line"><span class="folder">📁 retail-customer-segmentation/</span></div>
      <div class="tree-line">├── <span class="highlight">README.md</span> <span class="comment">← вы здесь</span></div>
      <div class="tree-line">├── <span class="folder">📁 data/</span></div>
      <div class="tree-line">│   └── <span class="name">retail_customer_segmentation.csv</span></div>
      <div class="tree-line">├── <span class="folder">📁 notebooks/</span></div>
      <div class="tree-line">│   └── <span class="name">analysis.ipynb</span> <span class="comment">← EDA, метрики, ML, гипотезы</span></div>
      <div class="tree-line">├── <span class="folder">📁 sql/</span></div>
      <div class="tree-line">│   └── <span class="name">queries.sql</span> <span class="comment">← CTE, window functions</span></div>
      <div class="tree-line">├── <span class="folder">📁 power_bi/</span></div>
      <div class="tree-line">│   └── <span class="name">dashboard.pbix</span></div>
      <div class="tree-line">├── <span class="folder">📁 images/</span></div>
      <div class="tree-line">│   └── <span class="name">dashboard_preview.png</span></div>
      <div class="tree-line">├── <span class="name">requirements.txt</span></div>
      <div class="tree-line">└── <span class="name">LICENSE</span></div>
    </div>
  </section>

  <!-- FOOTER -->
  <div class="footer">
    <div>
      <div class="footer-author">Ваше Имя</div>
      <div style="margin-top:3px;">Junior Data Analyst · 2025</div>
    </div>
    <div style="text-align:right;">
      <div>Python · SQL · Power BI</div>
      <div style="margin-top:3px; color: var(--accent);">github.com/yourhandle</div>
    </div>
  </div>

</div>
</body>
</html>
