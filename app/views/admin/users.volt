<div id="menu-wrapper">
    <div id="menu">
        <ul>
            <li class="current_page_item">
                <a href="/index">Home</a>
            <li><a href="/admin/">Список новостей</a></li>
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
                        <div class="post">
                            <div class="spis">
                                <p>Логин: {{ item.login }}</p>
                                <hr>
                                <p> Имя:</p>
                                {{ item.name }}
                                <p> Пароль:</p>
                                {{ item.pass }}
                                <p> Email:</p>
                                {{ item.email }}
                                <p> Телефон:</p>
                                {{ item.phone }}
                                <p> Дата рождения:</p>
                                {{ item.date }}
                            </div>
                        </div>
                    {% endfor %}
                    <div class="pag">
                        <a href="/admin/users/index?page={{ page.before }}"> Предыдущая </a>
                        <a href="/admin/users/index?page={{ page.next }}"> Следующая </a>
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





