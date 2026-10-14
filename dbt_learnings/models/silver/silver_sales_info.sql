WITH bronze_sales AS 
(
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        ROUND({{ multiple('unit_price', 'quantity') }}, 2) AS calculated_gross_amount,
        gross_amount,
        payment_method
    FROM    
        {{ ref('bronze_sales') }}
),
bronze_product AS 
(
    SELECT  
        product_sk,
        category
    FROM
        {{ ref('bronze_product') }}
),
bronze_customer AS 
(
    SELECT  
        customer_sk,
        gender
    FROM 
        {{ ref('bronze_customer') }}
),
joined_query AS 
(
SELECT 
    bronze_sales.sales_id,
    bronze_sales.gross_amount,
    bronze_sales.payment_method,
    bronze_product.category,
    bronze_customer.gender
FROM 
    bronze_sales
LEFT JOIN bronze_product
    ON bronze_sales.product_sk = bronze_product.product_sk
LEFT JOIN bronze_customer
    ON bronze_sales.customer_sk = bronze_customer.customer_sk
)
SELECT 
    category,
    gender,
    ROUND(SUM(gross_amount), 2) AS total_sales
FROM 
    joined_query
GROUP BY 
    category,
    gender
ORDER BY 
    total_sales DESC