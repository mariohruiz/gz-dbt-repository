WITH campaigns_data AS (
    SELECT
        c.date_date,
        c.ads_cost,
        f.average_basket,
        f.operational_margin,
        f.operational_margin - c.ads_cost AS ads_margin
    FROM {{ ref('int_campaigns_day') }} c         
    LEFT JOIN {{ ref('finance_days') }} f         
    ON c.date_date = f.date_date                  
)

SELECT *
FROM campaigns_data
ORDER BY date_date DESC                        
