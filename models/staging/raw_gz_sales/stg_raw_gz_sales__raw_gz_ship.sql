with 

source as (

    select * from {{ source('raw_gz_sales', 'raw_gz_ship') }}

),

renamed as (

    select

    from source

)

select * from renamed
