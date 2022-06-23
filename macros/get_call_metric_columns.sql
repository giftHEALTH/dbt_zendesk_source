{% macro get_call_metric_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "agent_id", "datatype": dbt_utils.type_int()},
    {"name": "call_charge", "datatype": dbt_utils.type_string()},
    {"name": "call_recording_consent", "datatype": dbt_utils.type_string()},
    {"name": "call_recording_consent_action", "datatype": dbt_utils.type_string()},
    {"name": "call_recording_consent_keypress", "datatype": dbt_utils.type_string()},
    {"name": "callback", "datatype": "boolean"},
    {"name": "callback_source", "datatype": dbt_utils.type_string()},
    {"name": "completion_status", "datatype": dbt_utils.type_string()},
    {"name": "consultation_time", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "customer_requested_voicemail", "datatype": "boolean"},
    {"name": "default_group", "datatype": "boolean"},
    {"name": "direction", "datatype": dbt_utils.type_string()},
    {"name": "duration", "datatype": dbt_utils.type_int()},
    {"name": "exceeded_queue_wait_time", "datatype": "boolean"},
    {"name": "hold_time", "datatype": dbt_utils.type_int()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "ivr_action", "datatype": dbt_utils.type_string()},
    {"name": "ivr_destination_group_name", "datatype": dbt_utils.type_string()},
    {"name": "ivr_hops", "datatype": dbt_utils.type_int()},
    {"name": "ivr_routed_to", "datatype": dbt_utils.type_string()},
    {"name": "ivr_time_spent", "datatype": dbt_utils.type_int()},
    {"name": "minutes_billed", "datatype": dbt_utils.type_int()},
    {"name": "not_recording_time", "datatype": dbt_utils.type_int()},
    {"name": "outside_business_hours", "datatype": "boolean"},
    {"name": "overflowed", "datatype": "boolean"},
    {"name": "overflowed_to", "datatype": dbt_utils.type_string()},
    {"name": "phone_number", "datatype": dbt_utils.type_string()},
    {"name": "recording_control_interactions", "datatype": dbt_utils.type_int()},
    {"name": "recording_time", "datatype": dbt_utils.type_int()},
    {"name": "talk_time", "datatype": dbt_utils.type_int()},
    {"name": "ticket_id", "datatype": dbt_utils.type_int()},
    {"name": "time_to_answer", "datatype": dbt_utils.type_int()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "voicemail", "datatype": "boolean"},
    {"name": "wait_time", "datatype": dbt_utils.type_int()},
    {"name": "wrap_up_time", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
