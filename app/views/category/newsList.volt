{{ partial('parts/head') }}

<div>
    {% if news|length %}
        {% for n in news %}
            {% set cat = categories[n.cat_id] %}

            <div class="card">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator" src="/public/{{ n.photo }}">
                    <span class="card-title">{{  n.title }}</span>
                </div>
                <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">
                        <i class="material-icons right">more_vert</i>
                    </span>
                    <p style="margin-bottom: 2px; color: #5099ff;">Автор - Unknown</p>
                    <p style="color: #5099ff;">Дата: {{n.date }}</p>
                </div>
                <div class="card-action">
                    <a style="height: 30px" class="right" href="/{{ cat.url }}/{{ n.url }}">
                        <p>Подробнее</p>
                    </a>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">
                        Описание<i class="material-icons right">close</i></span>
                    <p style="margin-top: 15px; font-size: medium;
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">{{ n.description }}</p>
                </div>
            </div>
        {% endfor %}
    {% else %}
        <p style="margin: 20px 0 20px 0;">По данной категории, ничего не найдено -_-</p>
    {% endif %}
</div>
