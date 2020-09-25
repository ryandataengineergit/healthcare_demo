create table raw_humana.medical_claims (
    admit_diag_cd varchar(255), 
    admit_src_cd varchar(255),  
    allow_icob_admit_cnt varchar(255),  -- should this be numeric?
    allow_icob_amt varchar(255),   -- should this be numeric?
    allow_icob_days_cnt varchar(255),  -- should this be numeric?
    allow_icob_visits_cnt varchar(255),  -- should this be numeric?
    bill_type_cd varchar(255),
    chrg_amt varchar(255),  -- should this be numeric?
    chrg_days_cnt varchar(255), -- should this be numeric?
    clm_aso_ind varchar(255),
    cob_paid_amt varchar(255),  -- should this be numeric?
    copay_amt varchar(255),  -- should this be numeric?
    cpt_mod_cd varchar(255),
    cpt_mod_cd2 varchar(255),
    ctrct_cat_cd varchar(255),
    deduct_amt varchar(255),  -- should this be numeric?
    primary_diag_cd varchar(255),
    diag_cd2 varchar(255),
    diag_cd3 varchar(255),
    diag_cd4 varchar(255),
    diag_cd5 varchar(255),
    diag_cd6 varchar(255),
    diag_cd7 varchar(255),
    diag_cd8 varchar(255),
    diag_cd9 varchar(255),
    diag_cd10 varchar(255),
    diag_cd11 varchar(255),
    diag_cd12 varchar(255),
    diag_cd13 varchar(255),
    diag_cd14 varchar(255),
    diag_cd15 varchar(255),
    diag_cd16 varchar(255),
    diag_cd17 varchar(255),
    diag_cd18 varchar(255),
    diag_cd19 varchar(255),
    diag_cd20 varchar(255),
    diag_cd21 varchar(255),
    diag_cd22 varchar(255),
    diag_cd23 varchar(255),
    diag_cd24 varchar(255),
    diag_cd25 varchar(255),
    dischg_stat_cd varchar(255) ,
    drg_lclm_cd varchar(255),
    fin_prod_cd varchar(255),
    hcpcs_cpt4_base_cd1 varchar(255),
    icd_proc_01_cd varchar(255),
    icd_proc_02_cd varchar(255),
    icd_proc_03_cd varchar(255),
    icd_proc_04_cd varchar(255),
    icd_proc_05_cd varchar(255),
    in_plan_ntwk_ind varchar(255),
    cov_month timestamp,  -- should this be string or date type?
    mbr_cost_shr_amt varchar(255), -- should this be numeric?
    mbr_pers_gen_key varchar(255),
    mco_contract_nbr varchar(255),
    medclm_key varchar(255),
    medclm_lclm_from_date timestamp, -- should this be string or date type?
    medclm_lclm_key varchar(255),
    medclm_lclm_to_date timestamp, -- should this be string or date type?
    ndc_id varchar(255),
    net_paid_amt varchar(255), -- should this be numeric?
    net_paid_days_cnt varchar(255), -- should this be numeric?
    npi_id varchar(255),
    paid_date datetime, -- should this be a string or date type?
    pbp_segment_id varchar(255),
    plan_benefit_package_id varchar(255),
    pot_cd varchar(255),
    prov_tax_id varchar(255),
    pymt_cat_cd varchar(255),
    raw_clm_billg_prov_key varchar(255),
    raw_clm_refr1_prov_key varchar(255),
    raw_clm_rendr_prov_key varchar(255),
    revenue_cd varchar(255),
    serv_from_date timestamp, -- should this be a string or date type?
    serv_to_date timestamp,  -- should this be a string or date type?
    serv_unit_cnt, --
    src_admit_date timestamp,  -- should this be a string or date type?
    src_dischrg_date timestamp, -- should this be a string or date type?
    src_mbr_id varchar(255),
    src_platform_cd varchar(255),
    src_prov_specialty_cd varchar(255)
);
