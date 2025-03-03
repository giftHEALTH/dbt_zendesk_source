{% macro get_ticket_custom_field_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_string()},
    {"name": "title", "datatype": dbt.type_string()},
    {"name": "raw_title", "datatype": dbt.type_string()},
    {"name": "description", "datatype": dbt.type_string()},
    {"name": "raw_description", "datatype": dbt.type_string()},
    {"name": "agent_description", "datatype": dbt.type_string()},
    {"name": "title_in_portal", "datatype": dbt.type_string()},
    {"name": "raw_title_in_portal", "datatype": dbt.type_string()},
    {"name": "type", "datatype": dbt.type_string()},
    {"name": "active", "datatype": "boolean"},
    {"name": "collapsed_for_agents", "datatype": "boolean"},
    {"name": "visible_in_portal", "datatype": "boolean"},
    {"name": "required", "datatype": "boolean"},
    {"name": "editable_in_portal", "datatype": "boolean"},
    {"name": "required_in_portal", "datatype": "boolean"},
    {"name": "system", "datatype": "boolean"},
    {"name": "removable", "datatype": "boolean"},
    {"name": "url", "datatype": dbt.type_string()},
    {"name": "sub_type_id", "datatype": dbt.type_int()},
    {"name": "relationship_target_type", "datatype": dbt.type_string()},
    {"name": "regexp_for_validation", "datatype": dbt.type_string()},
    {"name": "position", "datatype": dbt.type_int()},
    {"name": "tag", "datatype": dbt.type_string()},
    {"name": "key", "datatype": dbt.type_string()},
    {"name": "created_at", "datatype": dbt.type_string()},
    {"name": "updated_at", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
