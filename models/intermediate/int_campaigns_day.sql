WITH daily_campaigns AS (
    SELECT
        date_date,
        ROUND(SUM(ads_cost), 2) AS ads_cost,          
        SUM(impression) AS ads_impression,
        SUM(click) AS ads_clicks      
    FROM {{ ref('int_campaigns') }}  
    GROUP BY date_date                             
)

SELECT *
FROM daily_campaigns
ORDER BY date_date DESC                      
