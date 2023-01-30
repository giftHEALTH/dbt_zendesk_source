{% macro get_call_leg_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "agent_id", "datatype": dbt.type_int()},
    {"name": "call_id", "datatype": dbt.type_int()},
    {"name": "user_id", "datatype": dbt.type_int()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "completion_status", "datatype": dbt.type_string()},
    {"name": "duration", "datatype": dbt.type_int()},
    {"name": "hold_time", "datatype": dbt.type_int()},
    {"name": "minutes_billed", "datatype": dbt.type_int()},
    {"name": "call_charge", "datatype": dbt.type_string()},
    {"name": "talk_time", "datatype": dbt.type_int()},
    {"name": "wrap_up_time", "datatype": dbt.type_int()},
    {"name": "available_via", "datatype": dbt.type_string()},
    {"name": "conference_from", "datatype": dbt.type_int()},
    {"name": "conference_to", "datatype": dbt.type_int()},
    {"name": "conference_time", "datatype": dbt.type_int()},    
    {"name": "consultation_from", "datatype": dbt.type_int()},
    {"name": "consultation_to", "datatype": dbt.type_int()},    
    {"name": "consultation_time", "datatype": dbt.type_int()},    
    {"name": "forwarded_to", "datatype": dbt.type_string()},
    {"name": "transferred_from", "datatype": dbt.type_int()},
    {"name": "transferred_to", "datatype": dbt.type_int()},    
    {"name": "type", "datatype": dbt.type_string()}

] %}

{{ return(columns) }}

{% endmacro %}
