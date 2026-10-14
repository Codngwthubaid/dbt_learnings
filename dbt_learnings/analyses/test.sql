/*
SELECT  
    *
FROM 
    {{ ref('lookup') }}
*/

{# SELECT 
    {{ multiple(10,50) }} AS test_multiple
     #}

WITH dummy_calculation AS (
    SELECT {{ multiple(10, 50) }} AS test_multiple
)
SELECT * FROM dummy_calculation
