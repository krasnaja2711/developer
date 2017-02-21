<div id="menu-wrapper">
    <div id="menu">
        <ul>
            <li class="current_page_item">
                <a href="/index">Home</a>
            <li><a href="/admin/add/">Добавить новость</a></li>
            <li><a href="/admin/users/">Список пользователей</a></li>
        </ul>
    </div>
</div>
<div id="wrapper">
    <div id="header-wrapper">
        <div id="header">
            <div id="logo">
                <h1>Cats_world </h1>
                <p>Мир котов</p>
            </div>
        </div>
    </div>
    <div id="page">
        <div id="page-bgtop">
            <div id="page-bgbtm">
                <div id="content">
                    {% for item in page.items %}
                        {% set cat = categories[item.getCatId()] %}
                        <div class="post">
                            <div class="spis">
                                <p>Id: {{ item.id }}</p>
                                <hr>
                                <p> Заголовок:</p>
                                {{ item.title }}
                                <p>Ключевые слова:</p>
                                {{ item.key }}
                                <p> Краткая информация:</p>
                                {{ item.desc }}
                                <p> Фото:</p>
                                {{ item.photo }}
                                <p> Текст:</p>
                                {{ item.text }}
                                <p> Дата:</p>
                                {{ item.date }}
                                <p> Категория:</p>
                                {{ cat.getName() }}
                            </div>
                            <p><a href="/admin/edit/{{ item.getUrl() }}">Редактировать</a>
                                <a href="/admin/del/{{ item.getUrl() }}">Удалить</a></p>
                        </div>
                    {% endfor %}
                    <div class="pag">
                        <a href="/admin/index?page={{ page.before }}"> Предыдущая </a>
                        <a href="/admin/index?page={{ page.next }}"> Следующая </a>
                        {{ "Вы на странице " ~ page.current  ~ " из " ~ page.total_pages }}
                    </div>
                    <div style="clear: both;">&nbsp;</div>
                </div>
                <div style="clear: both;">&nbsp;</div>
            </div>
        </div>
    </div>
</div>
<div id="footer">
    <p>Copyright (c) 2013 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org">FCT</a>.
        Photos by Fotogrph</a>.</p>
</div>





