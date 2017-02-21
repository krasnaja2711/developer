
{{ partial('parts/head') }}

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
                      {% if session.get('authorization')!==null %}
                       {{ "Добро пожаловать, " ~ session.get('login') }}
                        {% endif %}
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
                    {% endfor %}
                    <div style="clear: both;">&nbsp;</div>
                </div>
                <div style="clear: both;">&nbsp;</div>
            </div>
        </div>
        {% if page.total_pages > 1 %}
        <div class="pag">
            <a href="/index"> 1 </a>
            {% for i in 2..page.total_pages %}
              <a href="/index?page={{ i }}" id="main-nav">{{ i }}  </a>
            {% endfor %}
        </div>
        {% endif %}
    </div>
</div>
<div id="footer">
    <p>Copyright (c) 2013 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org">FCT</a>.
        Photos by Fotogrph</a>.</p>
</div>
