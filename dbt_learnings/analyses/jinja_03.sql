{% set init_load = 1 %}
{% set last_load = 3 %}

{% set col_names = ["sales_id", "date_sk", "gross_amount"] %}

SELECT 
    
    {% for names in col_names %}
        {{ names }} 
        {% if not loop.last %},
        {% endif %} 
    {% endfor %}

FROM 
    {{ ref("bronze_sales") }}

{% if init_load == 1 %}

    WHERE date_sk > {{ last_load }}

{% endif %}

