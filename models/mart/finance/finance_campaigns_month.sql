WITH monthly_campaigns AS (
    SELECT
        DATE_TRUNC(date_date, MONTH) AS datemonth,
        ROUND(SUM(ads_margin), 2) AS ads_margin,
        ROUND(AVG(average_basket), 2) AS average_basket,
        ROUND(SUM(operational_margin), 2) AS operational_margin
    FROM {{ ref('finance_campaigns_day') }} 
    GROUP BY datemonth
)

SELECT *
FROM monthly_campaigns
ORDER BY datemonth DESC