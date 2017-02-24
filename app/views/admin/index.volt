
{{ partial('parts/head') }}

<nav>
    <div class="nav-wrapper">
        <div class="col s12">
            <a style="margin-left: 15px;" href="/index" class="breadcrumb">Home</a>
            <a href="/admin/add/" class="breadcrumb">Добавить новость</a>
            <a href="/admin/users/" class="breadcrumb">Список новостей</a>
        </div>
    </div>
</nav>

{% for item in page.items %}
    {% set cat = categories[item.getCatId()] %}
    <div class="card">
        <div class="card-image waves-effect waves-block waves-light">
            <img class="activator" src="/public/{{ item.photo }}">
            <span class="card-title">{{ item.title }}</span>
        </div>
        <div class="card-content">
                <span class="card-title activator grey-text text-darken-4">
                    <i class="material-icons right">more_vert</i>
                </span>
            <p style="margin-bottom: 2px; color: #5099ff;">Категория: {{ cat.getName() }}</p>
            <p style="color: #5099ff;">Дата: {{ item.date }}</p>
        </div>
        <div class="card-action">
            <a class="left" style="cursor: hand;"><i class="material-icons">thumb_up</i> 10</a>
            <a style="cursor: hand;"><i class="material-icons">comment</i> 2</a>
            <a href="/admin/edit/{{ item.getUrl() }}"><i class="material-icons">mode_edit</i></a>
            <a href="/admin/del/{{ item.getUrl() }}"><i class="material-icons">delete</i></a>
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
<div class="center" style="margin: 20px 0 20px 0;">
    <a href="/admin/index?page={{ page.before }}"> Предыдущая </a>
    {{ "Вы на странице " ~ page.current  ~ " из " ~ page.total_pages }}
    <a href="/admin/index?page={{ page.next }}"> Следующая </a>
</div>
