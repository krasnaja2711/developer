{{ partial('parts/head') }}

<style>
    .badrequest {
        font-size: 30px;
        margin-bottom: 20px;
    }
</style>
{% if page.items|length == 0 %}
    <div class="center text-navy badrequest">
        Извините, по вашему запросу ничего не найдено -_-
    </div>
{% else %}
    {% for item in page.items %}
        {% set cat = categories[item.getCatId()] %}
        <div class="card">
            <div class="card-image waves-effect waves-block waves-light">
                <img class="activator" src="/public/{{ item.getPhoto() }}">
                <span class="card-title">{{ item.getTitle() }}</span>
            </div>
            <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">
                        <i class="material-icons right">more_vert</i>
                    </span>
                <p style="margin-bottom: 2px; color: #5099ff;">Категория: {{ cat.getName() }}</p>
                <p style="color: #5099ff;">Дата: {{ item.getDate() }}</p>
            </div>
            <div class="card-action">
                <a class="left" style="cursor: hand;"><i class="material-icons">thumb_up</i> 10</a>
                <a style="cursor: hand;"><i class="material-icons">comment</i> 2</a>
                <a class="right" href="/{{ item.getUrl() }}/{{ item.getUrl() }}">Подробнее</a>
            </div>
            <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">Описание<i
                                class="material-icons right">close</i></span>
                <p style="margin-top: 15px; font-size: medium;
                    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">{{ item.getDescription() }}</p>
            </div>
        </div>
    {% endfor %}

    <div class="center" style="margin: 20px 0 20px 0;">
        <a href="/news/search/index?page={{ page.before }}"> Предыдущая </a>
        {{ "Вы на странице " ~ page.current  ~ " из " ~ page.total_pages }}
        <a href="/news/search/index?page={{ page.next }}"> Следующая </a>
    </div>
{% endif %}
