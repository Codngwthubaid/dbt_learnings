WITH bronze_returns AS 
(
    SELECT 
        sales_id,
        product_sk,
        store_sk,
        return_reason,
        refund_amount
    FROM 
        bronze_returns
),
bronze_product AS 
(
    SELECT 
        product_sk,
        supplier_sk,
        category
    FROM 
        bronze_product
),
bronze_store AS 
(
    SELECT
        store_sk,
        store_name
    FROM 
        bronze_store
),
joined_query AS (
SELECT 
    bronze_returns.sales_id,
    bronze_returns.product_sk,
    bronze_returns.store_sk,
    bronze_returns.return_reason,
    bronze_returns.refund_amount,
    bronze_product.category,
    bronze_store.store_name
FROM bronze_returns
LEFT JOIN bronze_product
    ON bronze_returns.product_sk = bronze_product.product_sk
LEFT JOIN bronze_store
    ON bronze_product.supplier_sk = bronze_store.store_sk
)
SELECT 
    category,
    return_reason,
    ROUND(SUM(refund_amount) , 2) AS total_refund_amount
FROM 
    joined_query
GROUP BY 
    category,
    return_reason
ORDER BY 
    total_refund_amount DESC