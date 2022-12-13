{{
    config(
        materialized='table'
    )
}}

with source as(

select distinct ID,NAME,PRODUCT_CODE,IS_ACTIVE,current_timestamp() as load_time from {{source('DEVELOPER_DB','PRODUCT_2') }})

select ID,NAME,PRODUCT_CODE,IS_ACTIVE,load_time from source
