{{
    config(
        dist = 'feature_link'
    )
}}

{{
    dbt_utils.union_relations(
        relations=[
            ref('eng_admission_discharge_status'),
            ref('eng_disease_stage')
        ],
        exclude=["client_id"]
    )
}}
