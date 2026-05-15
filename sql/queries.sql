-- ============================================================
-- Retail Customer Segmentation — SQL Analysis
-- Dataset: retail_customer_segmentation.csv
-- Table: customers
-- ============================================================


-- В1. Сколько клиентов в каждом сегменте и какую долю они занимают?
SELECT customer_segment,
       COUNT(customer_id) AS total_customers,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS share_pct
FROM customers
GROUP BY customer_segment
ORDER BY total_customers DESC;


-- В2. Какой регион имеет наибольший средний ежемесячный расход?
SELECT region,
       COUNT(customer_id) AS total_customers,
       ROUND(AVG(avg_monthly_spend), 2) AS avg_monthly_spend,
       ROUND(AVG(avg_order_value), 2) AS avg_order_value
FROM customers
GROUP BY region
ORDER BY avg_monthly_spend DESC;


-- В3. Тратят ли клиенты, часто использующие скидки, меньше в среднем?
SELECT 
    CASE 
        WHEN discount_usage_rate > 0.5 THEN 'Высокий дисконт (>50%)'
        ELSE 'Низкий дисконт (<=50%)'
    END AS discount_group,
    COUNT(customer_id) AS total_customers,
    ROUND(AVG(avg_order_value), 2) AS avg_order_value,
    ROUND(AVG(avg_monthly_spend), 2) AS avg_monthly_spend
FROM customers
GROUP BY discount_group
ORDER BY avg_monthly_spend DESC;


-- В4. Сравнение среднего чека и уровня возвратов между городскими и сельскими клиентами.
SELECT region,
       COUNT(customer_id) AS total_customers,
       ROUND(AVG(avg_monthly_spend), 2) AS avg_monthly_spend,
       ROUND(AVG(return_rate), 3) AS avg_return_rate
FROM customers
WHERE region IN ('Urban', 'Rural')
GROUP BY region;


-- В5. Какой сегмент клиентов имеет наибольший расчётный LTV?
SELECT customer_segment,
       COUNT(customer_id) AS total_customers,
       ROUND(AVG(avg_order_value * purchase_frequency * months_active), 0) AS avg_ltv,
       ROUND(MIN(avg_order_value * purchase_frequency * months_active), 0) AS min_ltv,
       ROUND(MAX(avg_order_value * purchase_frequency * months_active), 0) AS max_ltv
FROM customers
GROUP BY customer_segment
ORDER BY avg_ltv DESC;


-- В6. Какие 5 клиентов имеют наибольший расчётный LTV?
SELECT customer_id,
       age,
       region,
       customer_segment,
       payment_method,
       ROUND(avg_monthly_spend, 2) AS monthly_spend,
       ROUND(avg_order_value * purchase_frequency * months_active, 0) AS estimated_ltv
FROM customers
ORDER BY estimated_ltv DESC
LIMIT 5;


-- В7. Какой средний чек и уровень возвратов по каждому способу оплаты?
SELECT payment_method,
       COUNT(customer_id) AS total_customers,
       ROUND(AVG(avg_monthly_spend), 2) AS avg_monthly_spend,
       ROUND(AVG(return_rate), 3) AS avg_return_rate
FROM customers
GROUP BY payment_method
ORDER BY avg_monthly_spend DESC;


-- В8. Разделить клиентов на группы по уровню трат и показать количество в каждой.
WITH spend_groups AS (
    SELECT customer_id,
           avg_monthly_spend,
           CASE
               WHEN avg_monthly_spend < 200  THEN 'Низкий уровень'
               WHEN avg_monthly_spend BETWEEN 200 AND 600 THEN 'Средний уровень'
               ELSE 'Высокий уровень'
           END AS spend_tier
    FROM customers
)
SELECT spend_tier,
       COUNT(*) AS total_customers,
       ROUND(AVG(avg_monthly_spend), 2) AS avg_spend
FROM spend_groups
GROUP BY spend_tier
ORDER BY avg_spend DESC;


-- В9. Какие топ-3 сегмента по среднему чеку внутри каждого региона?
WITH regional_stats AS (
    SELECT region,
           customer_segment,
           ROUND(AVG(avg_monthly_spend), 2) AS avg_spend,
           COUNT(customer_id) AS total_customers,
           ROW_NUMBER() OVER (PARTITION BY region ORDER BY AVG(avg_monthly_spend) DESC) AS segment_rank
    FROM customers
    GROUP BY region, customer_segment
)
SELECT segment_rank,
       region,
       customer_segment,
       avg_spend,
       total_customers
FROM regional_stats
WHERE segment_rank <= 3
ORDER BY region, segment_rank;


-- В10. Как расходы каждого клиента соотносятся со средним по его сегменту?
SELECT customer_id,
       customer_segment,
       region,
       ROUND(avg_monthly_spend, 2) AS spend,
       ROUND(AVG(avg_monthly_spend) OVER (PARTITION BY customer_segment), 2) AS segment_avg,
       ROUND(avg_monthly_spend - AVG(avg_monthly_spend) OVER (PARTITION BY customer_segment), 2) AS diff_from_avg,
       RANK() OVER (PARTITION BY customer_segment ORDER BY avg_monthly_spend DESC) AS rank_in_segment
FROM customers
ORDER BY customer_segment, rank_in_segment
LIMIT 20;
