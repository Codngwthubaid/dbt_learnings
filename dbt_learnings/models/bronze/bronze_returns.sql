SELECT 
    *
FROM 
    {{ source('source_files', 'fact_returns') }}