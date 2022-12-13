{{
    config(
        materialized='table'
    )
}}

select D.ID,count(D.ID) as no_of_orders from "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."PRODUCT_2" as S
left join  "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."PRODUCT_DIM" as D on S.ID=D.ID and S.NAME=D.NAME and
S.PRODUCT_CODE=D.PRODUCT_CODE and S.IS_ACTIVE=D.IS_ACTIVE group by D.ID
