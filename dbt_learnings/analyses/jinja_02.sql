{# declaring an array in jinja #}
{%- set friends = ["Alam Saif", "Yasir", "Khizar", "Shahzaib", "Abdul Samad"] -%}

{# running a FOR loop #}
{% for friend in friends %}

{# rendering the values of the array under condition of IF - ELSE#}
    {% if friend != 'Alam Saif' %}

        School Friend - {{ friend }}

    {% else %}
        College Friend - {{ friend }}

    {% endif %}

{% endfor %}  