
with base as (

    select * 
    from {{ ref('stg_zendesk__call_leg_tmp') }}

),

fields as (

    select
        /*
        The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
        that are expected/needed (staging_columns from dbt_zendesk_source/models/tmp/) and compares it with columns 
        in the source (source_columns from dbt_zendesk_source/macros/).
        For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
        */
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zendesk__call_leg_tmp')),
                staging_columns=get_call_leg_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        id       AS call_leg_id,
        agent_id,
        call_id AS call_metric_id,
        user_id,
        available_via,
        type    AS call_leg_type,
        completion_status,
        conference_from,
        conference_to,
        conference_time,
        consultation_from,
        consultation_to,
        consultation_time,
        forwarded_to,
        minutes_billed,
        call_charge,
        duration,
        hold_time,
        talk_time,
        wrap_up_time,
        transferred_from,
        transferred_to,
        {% if target.type == 'redshift' -%}
            cast(created_at as timestamp without time zone) as created_at,
            cast(updated_at as timestamp without time zone) as updated_at,
        {% else -%}
            created_at,
            updated_at,
        {% endif %}
        _fivetran_synced
    from fields
)

select * 
from final