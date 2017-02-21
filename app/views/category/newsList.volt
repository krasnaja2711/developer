
{{ partial('parts/head') }}
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
                    {% for n in news %}
                        {% set cat = categories[n.getCatId()] %}
                    <div class="post">
                        <h2 class="title"> <a href="/{{ cat.getUrl() }}/{{ n.getUrl() }}">{{ n.getTitle() }}</a></h2>
                        <p class="meta"> on {{ n.getDate() }}</p>
                        <div class="entry">
                            <p><img src="/public/{{ n.getPhoto() }}" width="800" height="300" alt=""/></p>
                            <p><p>{{ n.getDesc() }}</p></p>
                        </div>
                    </div>
                        {% endfor %}
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


