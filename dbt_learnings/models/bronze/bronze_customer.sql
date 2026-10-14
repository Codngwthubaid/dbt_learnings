SELECT 
    *
FROM 
    {{ source('source_files', 'dim_customer') }}