WITH facebook_campaigns AS (
    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_gz_facebook') }}
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
    FROM {{ ref('stg_gz_adwords') }}
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
    FROM {{ ref('stg_gz_bing') }}
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
    FROM {{ ref('stg_gz_criteo') }}
)

-- Combine all staging models using UNION ALL
SELECT * FROM facebook_campaigns
UNION ALL
SELECT * FROM adwords_campaigns
UNION ALL
SELECT * FROM bing_campaigns
UNION ALL
SELECT * FROM criteo_campaigns
