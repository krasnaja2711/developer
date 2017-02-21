<link href="/public/css/modal.css" rel="stylesheet" type="text/css"/>
<div id="menu-wrapper">
    <div id="menu">
        <ul>
            {% if session.get('authorization')!==null %}
                <a class="post" href="/login/logout" onclick="document.getElementById('myform').submit(); return false;"
                   id="login_pop"> Выйти </a>
            {% endif %}
            <li class="current_page_item">
                <a href="/index">Home</a>
                {% for cat in categories %}
            <li><a href="/{{ cat.getUrl() }}">{{ cat.getName() }}</a></li>
            {% endfor %}
            {% if session.get('authorization')=== 1 %}
                <li><a href="/admin">Админ</a></li>
            {% endif %}
        </ul>
    </div>
</div>
<form method="post" action="/login/logout" id="myform">
    <input type="hidden" name="current_url" value="{{ router.getRewriteUri() }}">
</form>
<div id="wrapper">
    <div id="header-wrapper">
        <div id="header">
            <div id="search">
                <form action="/news/search" method="post">
                    <input type="text" name="search">
                    {{ submit_button("Поиск") }}
                </form>
            </div>
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
                {% set count = 0 %}
                {% for item in page.items %}
                    {% set cat = categories[item.getCatId()] %}
                    <div class="post">
                        <h2 class="title"><a href="/{{ cat.getUrl() }}/{{ item.getUrl() }}">{{ item.getTitle() }}</a>
                        </h2>
                        <p class="meta"> on {{ item.getDate() }}</p>
                        <div class="entry">
                            <p><img src="/public/{{ item.getPhoto() }}" width="800" height="300" alt=""/></p>
                            <p>{{ item.getDesc() }}</p>
                        </div>
                    </div>
                    {% set count=count+1 %}
               {% endfor %}
                {% if count===0 %}
                    {{ "Извините, по вашему запросу ничего не найдено" }}
                {% endif %}
                <div style="clear: both;">&nbsp;</div>
            </div>
            <div style="clear: both;">&nbsp;</div>
        </div>
    </div>
    {% if page.total_pages > 1 %}
    <div class="pag">
        <a href="/news/search/index?page={{ page.before }}"> Предыдущая </a>
        <a href="/news/search/index?page={{ page.next }}"> Следующая </a>
        {{  "Вы на странице " ~ page.current  ~ " из " ~ page.total_pages  }}
    </div>
    {% endif %}
</div>
</div>
<div id="footer">
    <p>Copyright (c) 2013 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org">FCT</a>.
        Photos by Fotogrph</a>.</p>
</div>
