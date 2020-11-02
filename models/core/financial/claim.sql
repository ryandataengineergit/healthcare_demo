{{
    config(
        dist = 'identifier_claim_header'
    )
}}
with claim_header as (

    select *
    from {{ ref('claim_header__union') }}

)

select *
from claim_header