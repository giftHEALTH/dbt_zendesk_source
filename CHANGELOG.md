# dbt_zendesk_source v0.6.1

dbt_utils v1.0.0 Compatibility
## 🚨 Breaking Changes 🚨
- Updates to require fivetran_utils [">=0.4.0", "<0.5.0"], which relies on dbt_utils v1.0.0.  


## Features
- The `stg_zendesk__ticket` table now allows for your custom passthrough columns to be added via the `zendesk__ticket_passthrough_columns` variable. You can add your passthrough columns as a list within the variable in your project configuration. ([#27](https://github.com/fivetran/dbt_zendesk_source/pull/27))
# dbt_zendesk_source v0.6.0

# Features
- Incorporates the `daylight_time` and `time_zone` source tables into the package. In the transform package, these tables are used to more precisely calculate business hour metrics ([#62](https://github.com/fivetran/dbt_zendesk/issues/62)). 

# dbt_zendesk_source v0.5.0
🎉 dbt v1.0.0 Compatibility 🎉
## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependency to refer to the latest `dbt_fivetran_utils`. The latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.

# dbt_zendesk_source v0.4.2
## Fixes
- Adjusted timestamp fields within staging models to explicitly cast the data type as `timestamp without time zone`. This fixes a Redshift error where downstream datediff and dateadd functions would result in an error if the timestamp fields are synced as `timestamp_tz`. ([#23](https://github.com/fivetran/dbt_zendesk_source/pull/23))

## Contributors
- @juanbriones ([#55](https://github.com/fivetran/dbt_zendesk/issues/55))


# dbt_zendesk_source v0.1.0 -> v0.4.1
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!
