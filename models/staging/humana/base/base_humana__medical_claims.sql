{{
    config(
        materialized = 'ephemeral'
    )
}}

with source as (

    select * from {{ source('humana_src','medical_claims') }}

),

add_row_num as (
    select row_number() over(partition by medclm_key
                             order by ingest_date desc) as row_num,
           *
    from source
),

source_renamed as (

    select {{ empty_string_to_null('admit_diag_cd') }} as admit_diag_cd,
           {{ empty_string_to_null('admit_src_cd') }} as admit_src_cd,
           {{ empty_string_to_null('allow_icob_admit_cnt') }} as allow_icob_admit_cnt,
           {{ empty_string_to_null('allow_icob_amt') }} as allow_icob_amt,
           {{ empty_string_to_null('allow_icob_days_cnt') }} as allow_icob_days_cnt,
           {{ empty_string_to_null('allow_icob_visits_cnt') }} as allow_icob_visits_cnt,
           {{ empty_string_to_null('bill_type_cd') }} as sub_type,
           date(medclm_lclm_to_date) as billable_period_end,
           date(medclm_lclm_from_date) as billable_period_start,
           chrg_amt::numeric(18,2) as chrg_amt,
           {{ empty_string_to_null('chrg_days_cnt') }} as chrg_days_cnt,
           {{ empty_string_to_null('clm_aso_ind') }} as clm_aso_ind,
           {{ empty_string_to_null('cob_paid_amt') }} as cob_paid_amt,
           {{ empty_string_to_null('copay_amt') }} as copay_amt,
           {{ empty_string_to_null('cov_month') }} as cov_month,
           {{ empty_string_to_null('ctrct_cat_cd') }} as ctrct_cat_cd,
           {{ empty_string_to_null('deduct_amt') }} as deduct_amt,
           {{ empty_string_to_null('diag_cd2') }} as diag_cd2,
           {{ empty_string_to_null('diag_cd3') }} as diag_cd3,
           {{ empty_string_to_null('diag_cd4') }} as diag_cd4,
           {{ empty_string_to_null('diag_cd5') }} as diag_cd5,
           {{ empty_string_to_null('diag_cd6') }} as diag_cd6,
           {{ empty_string_to_null('diag_cd7') }} as diag_cd7,
           {{ empty_string_to_null('diag_cd8') }} as diag_cd8,
           {{ empty_string_to_null('diag_cd9') }} as diag_cd9,
           {{ empty_string_to_null('diag_cd10') }} as diag_cd10,
           {{ empty_string_to_null('diag_cd11') }} as diag_cd11,
           {{ empty_string_to_null('diag_cd12') }} as diag_cd12,
           {{ empty_string_to_null('diag_cd13') }} as diag_cd13,
           {{ empty_string_to_null('diag_cd14') }} as diag_cd14,
           {{ empty_string_to_null('diag_cd15') }} as diag_cd15,
           {{ empty_string_to_null('diag_cd16') }} as diag_cd16,
           {{ empty_string_to_null('diag_cd17') }} as diag_cd17,
           {{ empty_string_to_null('diag_cd18') }} as diag_cd18,
           {{ empty_string_to_null('diag_cd19') }} as diag_cd19,
           {{ empty_string_to_null('diag_cd20') }} as diag_cd20,
           {{ empty_string_to_null('diag_cd21') }} as diag_cd21,
           {{ empty_string_to_null('diag_cd22') }} as diag_cd22,
           {{ empty_string_to_null('diag_cd23') }} as diag_cd23,
           {{ empty_string_to_null('diag_cd24') }} as diag_cd24,
           {{ empty_string_to_null('diag_cd25') }} as diag_cd25,
           {{ empty_string_to_null('dischg_stat_cd') }} as dischg_stat_cd,
           {{ empty_string_to_null('drg_lclm_cd') }} as drg_lclm_cd,
           {{ empty_string_to_null('fin_prod_cd') }} as fin_prod_cd,
           {{ empty_string_to_null('icd_proc_01_cd') }} as icd_proc_01_cd,
           {{ empty_string_to_null('icd_proc_02_cd') }} as icd_proc_02_cd,
           {{ empty_string_to_null('icd_proc_03_cd') }} as icd_proc_03_cd,
           {{ empty_string_to_null('icd_proc_04_cd') }} as icd_proc_04_cd,
           {{ empty_string_to_null('icd_proc_05_cd') }} as icd_proc_05_cd,
           medclm_lclm_key as identifier_claim_header,
           row_number() over(partition by medclm_lclm_key
                             order by medclm_key)::varchar as identifier_claim_line,
           {{ dbt_utils.surrogate_key(['mbr_pers_gen_key']) }} as identifier_external_source,
           {{ empty_string_to_null('in_plan_ntwk_ind') }} as in_plan_ntwk_ind,
           {{ empty_string_to_null('mbr_cost_shr_amt') }} as mbr_cost_shr_amt,
           {{ empty_string_to_null('mco_contract_nbr') }} as mco_contract_nbr,
           medclm_key,
           {{ empty_string_to_null('cpt_mod_cd') }} as modifier_1,
           {{ empty_string_to_null('cpt_mod_cd2') }} as modifier_2,
           {{ empty_string_to_null('ndc_id') }} as ndc_id,
           {{ empty_string_to_null('net_paid_amt') }} as net_paid_amt,
           {{ empty_string_to_null('net_paid_days_cnt') }} as net_paid_days_cnt,
           {{ empty_string_to_null('paid_date') }} as paid_date,
           {{ dbt_utils.surrogate_key(['mbr_pers_gen_key']) }} as patient,
           {{ empty_string_to_null('pbp_segment_id') }} as pbp_segment_id,
           {{ empty_string_to_null('plan_benefit_package_id') }} as plan_benefit_package_id,
           {{ empty_string_to_null('pot_cd') }} as pot_cd,
           {{ empty_string_to_null('primary_diag_cd') }} as primary_diag_cd,
           {{ empty_string_to_null('hcpcs_cpt4_base_cd1') }} as product_or_service,
           {{ empty_string_to_null('prov_tax_id') }} as prov_tax_id,
           {{ empty_string_to_null('npi_id') }} as npi_id,
           {{ empty_string_to_null('pymt_cat_cd') }} as pymt_cat_cd,
           {{ empty_string_to_null('raw_clm_billg_prov_key') }} as raw_clm_billg_prov_key,
           {{ empty_string_to_null('raw_clm_refr1_prov_key') }} as raw_clm_refr1_prov_key,
           {{ empty_string_to_null('raw_clm_rendr_prov_key') }} as raw_clm_rendr_prov_key,
           {{ empty_string_to_null('revenue_cd') }} as revenue,
           date(serv_to_date) as serviced_period_end,
           date(serv_from_date) as serviced_period_start,
           serv_unit_cnt::numeric(18,2) as quantity,
           {{ empty_string_to_null('src_admit_date') }} as admit_datetime,
           {{ empty_string_to_null('src_dischrg_date') }} as discharge_datetime,
           {{ empty_string_to_null('src_mbr_id') }} as src_mbr_id,
           {{ empty_string_to_null('src_platform_cd') }} as src_platform_cd,
           {{ empty_string_to_null('src_prov_specialty_cd') }} as src_prov_specialty_cd,
           client_id,
           ingest_date

    from add_row_num
    where row_num = 1

)

select *
from source_renamed