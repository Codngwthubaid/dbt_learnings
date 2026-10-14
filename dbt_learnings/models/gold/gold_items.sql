WITH dedup_query AS
(
    SELECT 
    *,
    ROW_NUMBER()
        OVER(
            PARTITION BY item_id
            ORDER BY updated_at DESC
        ) AS dedup_id
    FROM 
        {{ source('source_files', 'items') }}
) 
SELECT 
    item_id,
    item_name,
    item_category,
    updated_at
FROM   
    dedup_query
WHERE 
    dedup_id = 1;
    