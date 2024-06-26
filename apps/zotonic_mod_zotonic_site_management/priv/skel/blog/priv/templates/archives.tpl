{% extends "base.tpl" %}

{% block title %}{_ Archive for _} {% if q.month %}{{ q.month|escape }}, {% endif %}{{ q.year|escape }}{% endblock %}

{% block chapeau %}
    <h5 class="chapeau">{_ Archive for _} {% if q.month %}{{ [q.year, q.month, 1]|date:"F":false }}, {% endif %}{{ q.year|escape }}</h5>
{% endblock %}

{% block content %}

    {% with m.search.paged[{query publication_year=q.year publication_month=q.month sort='-publication_start' cat=cat page=q.page pagelen=m.site.pagelen}] as result %}

        {% for id in result %}

            {% include "_article_summary.tpl" id=id %}

        {% endfor %}

        {% pager result=result dispatch=zotonic_dispatch year=q.year month=q.month %}

    {% endwith %}

{% endblock %}
