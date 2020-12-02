with

core_patient as (
    select * from {{ ref('patient') }}
),

core_claim as (
    select * from {{ ref('claim') }}
),

joined as (
	select distinct
		core_patient.identifier_external_source
		,core_patient.gender
		,core_claim.identifier_claim_header
	from core_patient inner join core_claim
	on core_patient.identifier_external_source = core_claim.patient
),

admit_rate as (
	select *
	from {{ ref('quantity_features') }}
	where feature_code = '100004'
),

admit_length as (
    select *
    from {{ ref('quantity_features') }}
    where feature_code = '100003'
),

age_at_claim_date as (
	select *
	from {{ ref('quantity_features') }}
	where feature_code = '100000'
),

add_features as (
	select
		joined.identifier_claim_header
		,joined.gender
		,admit_rate.feature_value as admit_rate_12months
		,admit_length.feature_value as admit_length
		,age_at_claim_date.feature_value as age_at_claim_date
	from joined left join admit_rate
	on joined.identifier_claim_header = admit_rate.feature_link left join admit_length
	on joined.identifier_claim_header = admit_length.feature_link left join age_at_claim_date
	on joined.identifier_claim_header = age_at_claim_date.feature_link
)

select distinct * 
from add_features 
where admit_rate_12months is not null
or admit_length is not null
or age_at_claim_date is not null