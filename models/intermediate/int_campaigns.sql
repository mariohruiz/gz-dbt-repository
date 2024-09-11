WITH facebook_campaigns AS (
    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__raw_gz_facebook') }}  -- Correct reference for Facebook
),

adwords_campaigns AS (
    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__raw_gz_adwords') }}  -- Correct reference for Adwords
),

bing_campaigns AS (
    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__raw_gz_bing') }}  -- Correct reference for Bing
),

criteo_campaigns AS (
    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__raw_gz_criteo') }}  -- Correct reference for Criteo
)

-- Combine all staging models using UNION ALL
SELECT * FROM facebook_campaigns
UNION ALL
SELECT * FROM adwords_campaigns
UNION ALL
SELECT * FROM bing_campaigns
UNION ALL
SELECT * FROM criteo_campaigns

