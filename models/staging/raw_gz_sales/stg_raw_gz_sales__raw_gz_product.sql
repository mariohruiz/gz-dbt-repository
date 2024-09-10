with 

source as (

    select * from {{ source('raw_gz_sales', 'raw_gz_product') }}

),

renamed as (

    select

    from source

)

select * from renamed
