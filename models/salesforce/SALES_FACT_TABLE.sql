{{
    config(
        materialized='table'
    )
}}

select A.ID as Account_id,o.ID as order_id,opper.ID as opertunity_id,S.AMOUNT,cap.ID as capaign_id,S.EXPECTED_REVENUE,S.BUDGETED_COST,
S.ACTUAL_COST,L.ID as lead_Id,contract.ID as contract_Id,p.ID as product_id,
contact.ID as contact_id,cases.ID as case_Id,count(S.ID) as
No_Of_Orders from "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."STAGE_TABLE" as S
left join "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."ACCOUNT_DIM" as A on S.ID=A.ID
left join "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."ORDERS_DIM" as o on S.ORDER_ID=O.ID
left join "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."OPPORTUNITY_DIM" as opper on S.OPP_ID=opper.ID
left join "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."CAMPAIGN_DIM" as cap on S.CAMPAIN_ID=cap.ID
left join "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."LEADS_DIM" as L on S.LEAD_ID=L.ID
left join "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."CONTRACT_DIM" as contract on S.CONTRACT_ID=contract.ID
left join "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."PRODUCT_DIM" as p on S.PRODUCT_ID=p.ID
left join "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."CONTACT_DIM" as contact on S.CONTACT_ID=contact.ID
left join "DEVELOPER_DB"."TIRUPATHIRAO_SCHEMA"."CASE_DIM" as cases on S.CASE_ID=cases.ID
group by A.ID,o.ID,opper.ID,S.AMOUNT,cap.ID,S.EXPECTED_REVENUE,S.BUDGETED_COST,
S.ACTUAL_COST,L.ID,contract.ID,p.ID,contact.ID,cases.ID,S.ID