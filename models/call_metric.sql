
with base as (

    select * 
    from {{ ref('call_metric_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('call_metric_tmp')),
                staging_columns=get_call_metric_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        id as call_metric_id,
        ticket_id,
        agent_id,
        _fivetran_synced,
        {% if target.type == 'redshift' -%}
            cast(created_at as timestamp without time zone) as created_at,
            cast(updated_at as timestamp without time zone) as updated_at,
        {% else -%}
            created_at,
            updated_at,
        {% endif %}
        direction,
        duration,
        completion_status,
        voicemail,
        phone_number,
        wait_time,
        hold_time,
        talk_time,
        time_to_answer,
        wrap_up_time,
        consultation_time,
        exceeded_queue_wait_time,
        outside_business_hours,
        customer_requested_voicemail,
        minutes_billed,
        call_charge,
        ivr_time_spent,
        ivr_hops,
        ivr_destination_group_name,
        ivr_routed_to,
        ivr_action,
        default_group,
        callback,
        callback_source,
        overflowed,
        overflowed_to,
        recording_control_interactions,
        recording_time,
        not_recording_time,
        call_recording_consent,
        call_recording_consent_action,
        call_recording_consent_keypress

    from fields
)

select * 
from final
