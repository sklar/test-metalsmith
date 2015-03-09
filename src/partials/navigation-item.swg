{# <!-- {{ console.log(item) }} --> #}
{% if item.path|replace('.+\/index.html', 'index') != 'index' %}
    <li class="nav__item">
        {% if item.file %}
            <a href="{{ item.path }}">{{ item.file.title }}</a>
            <br>{{ item.type }} # {{ item.path }}
        {% elseif item.children.length %}
            <a href="{{ item.path }}">{{ item.children|find({name: 'index.html'}).file.title }}</a>
            <br>{{ item.type }} # {{ item.path }}
            <ul>
            {% for child in item.children %}
                {% include 'navigation-item.swg' with {item: child} only %}
            {% endfor %}
            </ul>
        {% endif %}
    </li>
{% endif %}
