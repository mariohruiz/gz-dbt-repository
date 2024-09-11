WITH source AS (

    SELECT * 
    FROM {{ source('raw', 'sales') }}

),

renamed AS (

    SELECT
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity
    FROM source

)

SELECT * 
FROM renamed;
