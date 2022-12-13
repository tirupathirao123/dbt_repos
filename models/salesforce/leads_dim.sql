{{
    config(
        materialized='table'
    )
}}

with source as(

select distinct ID,LAST_NAME,FIRST_NAME,NAME,COMPANY,STREET,CITY,STATE,POSTAL_CODE,COUNTRY,STATUS,
current_timestamp() as leads_load_time from {{source('DEVELOPER_DB','LEAD') }})

select ID,LAST_NAME,FIRST_NAME,NAME,COMPANY,STREET,CITY,STATE,POSTAL_CODE,COUNTRY,STATUS,leads_load_time from source