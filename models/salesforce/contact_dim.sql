{{
    config(
        materialized='table'
    )
}}

with source as(

select distinct ID,NAME,MAILING_STREET,MAILING_CITY,MAILING_STATE,MAILING_POSTAL_CODE,MAILING_COUNTRY,
PHONE,MOBILE_PHONE,EMAIL,current_timestamp() as contact_load_time from {{source('DEVELOPER_DB','CONTACT') }})

select ID,NAME,MAILING_STREET,MAILING_CITY,MAILING_STATE,MAILING_POSTAL_CODE,MAILING_COUNTRY,
PHONE,MOBILE_PHONE,EMAIL,contact_load_time from source