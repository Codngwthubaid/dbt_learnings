{# define config for this file - that how this data will be store in the catalog at databricks - this way is the BLOCK way to define the config for defining materialized view #}
{{
  config(
    materialized = 'view',
    )
}}


/*
The below SQL code fetchs the data from the source i.e available on databricks due to this when we run the query we cannot able to detect where this data was coming (in the lineage section)
*/

/*
SELECT 
    *
FROM 
    dbt_learnings.source_files.fact_sales 
*/


/*
The below SQL code fetchs the data from the source folder which was present inside the models folder from the source.yml file - 
*/

SELECT 
    *
FROM 
    {{ source('source_files', 'fact_sales') }}