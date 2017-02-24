{{ partial('parts/head') }}
{% for item in page.items %}
    {% set cat = categories[item.cat_id] %}
    <div class="card">
        <div class="card-image waves-effect waves-block waves-light">
            <img class="activator" src="/public/{{ item.photo }}">
            <span class="card-title">{{ item.title }}</span>
        </div>
        <div class="card-content">
            <span class="card-title activator grey-text text-darken-4">
                <i class="material-icons right">more_vert</i>
            </span>
            <p style="margin-bottom: 2px; color: #5099ff;">Автор - {{ item.login }}</p>
            <p style="margin-bottom: 2px; color: #5099ff;">Категория: {{ cat.name }}</p>
            <p style="color: #5099ff;">Дата: {{ item.date }}</p>
        </div>
        <div class="card-action">
            <a class="left" style="cursor: hand;"><i class="material-icons">thumb_up</i> 10</a>
            <a style="cursor: hand;"><i class="material-icons">comment</i> 2</a>
            <a class="right" href="/{{ cat.url }}/{{ item.url }}">Подробнее</a>
        </div>
        <div class="card-reveal">
            <span class="card-title grey-text text-darken-4">Описание<i
                        class="material-icons right">close</i></span>
            <p style="margin-top: 15px; font-size: medium;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">{{ item.description }}</p>
        </div>
    </div>
{% endfor %}

    {% if page.total_pages > 1 %}
        <div class="row">
            <div class="center" style="margin: 20px 0 20px 0;">
                <ul class="pagination">
                    <li class="disabled">
                        <i class="material-icons">chevron_left</i>
                    </li>
                    {% for i in 1..page.total_pages %}
                        {% if i in request.getQuery() %}
                            <li class="active">
                                <a href="/index?page={{ i }}">{{ i }}</a>
                            </li>
                        {% elseif i not in request.getQuery() %}
                            {% if i == 1 %}
                                <li class="active">
                                    <a href="/index?page=1">{{ i }}</a>
                                </li>
                            {% else %}
                                <li><a href="/index?page={{ i }}">{{ i }}</a></li>
                            {% endif %}
                        {% else %}
                            <li class="waves-effect"><a href="/index?page={{ i }}">{{ i }}</a></li>
                        {% endif %}
                    {% endfor %}
                    <li class="disabled">
                        <i class="material-icons">chevron_right</i>
                    </li>
                </ul>
            </div>
        </div>
    {% endif %}