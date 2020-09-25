create table raw_ssm.referral (
    patient varchar(255),
    patient_account_number varchar(255),
    clinical_encounter_id varchar(255),
    referral_id varchar(255),
    referral_date timestamp,
    sender_network varchar(255),
    sending_practice varchar(255),
    sending_practitioner_npi varchar(255),
    receiver_network varchar(255),
    receiving_practice varchar(255),
    receiving_practitioner_npi varchar(255),
    receiving_organization varchar(255),
    receiving_organization_id varchar(255),
    referral_icd_code varchar(255),
    referral_cpt_code varchar(255),
    referral_description varchar(255),
    out_of_network_status varchar(255),
    out_of_network_reason varchar(255),
    created_timestamp timestamp,
    modified_timestamp timestamp
);