create external table raw_ssm.member_eligibility (
    first_name varchar(255),
    middle_name varchar(255),
    last_name varchar(255),
    social_security varchar(15),
    dob timestamp,
    patient_id varchar(255),
    relation varchar(255),
    gender varchar(255),
    race varchar(255),
    ethnic_group varchar(255),
    primary_phone varchar(50),
    primary_email varchar(255),
    address_line1 varchar(255),
    address_line2 varchar(255),
    city varchar(255),
    state varchar(255),
    zip varchar(255),
    eff_date timestamp,
    term_date timestamp,
    lob varchar(255),
    contract varchar(255),
    insurance_name varchar(255),
    primary_care_prov_id varchar(255)
)
partitioned by (client_id varchar(50), ingest_date char(10))
row format delimited
fields terminated by '|'
stored as textfile
location 's3://strive-analytics-warehouse/clients/client_id=ssm/data_frequency=batch/member-eligibility/'
table properties ('skip.header.line.count' = '1');

alter table raw_ssm.member_eligibility add
partition(client_id='ssm', ingest_id='2020-03-01') 
location 's3://strive-analytics-warehouse/clients/client_id=ssm/data_frequency=batch/member-eligibility/ingest_date=2020-03-01/';