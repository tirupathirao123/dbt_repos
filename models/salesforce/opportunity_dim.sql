{{
    config(
        materialized='table'
    )
}}

with source as(

select distinct ID,NAME,STAGE_NAME,TYPE,LEAD_SOURCE,FORECAST_CATEGORY,MAIN_COMPETITORS_C,
current_timestamp() as opportunity_load_time from {{source('DEVELOPER_DB','OPPORTUNITY') }})

select ID,NAME,STAGE_NAME,TYPE,LEAD_SOURCE,FORECAST_CATEGORY,MAIN_COMPETITORS_C,opportunity_load_time from source