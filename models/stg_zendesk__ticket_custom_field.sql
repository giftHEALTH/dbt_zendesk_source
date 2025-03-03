
with base as (

    select *
    from {{ ref('stg_zendesk__ticket_custom_field_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('stg_zendesk__ticket_custom_field_tmp')),
                staging_columns=get_ticket_custom_field_columns()
            )
        }}

    from base
),

final as (

    select
        id as ticket_custom_field_id,
        _fivetran_synced,
        title,
        raw_title,
        description,
        raw_description,
        agent_description,
        title_in_portal,
        raw_title_in_portal,
        type,
        active AS is_active,
        collapsed_for_agents AS is_collapsed_for_agents,
        visible_in_portal AS is_visible_in_portal,
        required AS is_required,
        editable_in_portal AS is_editable_in_portal,
        required_in_portal AS is_required_in_portal,
        system AS is_system,
        removable AS is_removable,
        url,
        sub_type_id,
        relationship_target_type,
        regexp_for_validation,
        tag,
        position,
        key,
        created_at,
        updated_at
    from fields
)

select *
from final
