{{ partial('parts/head') }}

<div>
    {% for n in news %}
        {% set cat = categories[n.getCatId()] %}

        <div class="card">
            <div class="card-image waves-effect waves-block waves-light">
                <img class="activator" src="/public/{{ n.getPhoto() }}">
                <span class="card-title">{{ n.getTitle() }}</span>
            </div>
            <div class="card-content">
<span class="card-title activator grey-text text-darken-4">
<i class="material-icons right">more_vert</i>
</span>
                <p style="margin-bottom: 2px; color: #5099ff;">Автор - Unknown</p>
                <p style="color: #5099ff;">Дата: {{ n.getDate() }}</p>
            </div>
            <div class="card-action">
                <a style="height: 30px" class="right" href="/{{ cat.getUrl() }}/{{ n.getUrl() }}">
                    <p>Подробнее</p>
                </a>
            </div>
            <div class="card-reveal">
                <span class="card-title grey-text text-darken-4">
                    Описание<i class="material-icons right">close</i></span>
                <p style="margin-top: 15px; font-size: medium;
font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">{{ n.getDescription() }}</p>
            </div>
        </div>
    {% endfor %}
</div>
