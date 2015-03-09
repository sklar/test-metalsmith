<nav role="navigation">
    <ul>
    {% for item in navigation.primary %}
        {% include 'navigation-item.swg' %}
    {% endfor %}
    </ul>
</nav>
