<head xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
    <meta name="keywords" content="{{ news.key }}"/>
    <meta name="description" content=" {{ news.desc }}"/>
    <script type="text/javascript" src="/public/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript"  src ="/public/js/detail.js"></script>
    {{ partial('parts/head') }}
</head>
<body>
<div id="wrapper">
    <div id="header-wrapper">
        <div id="header">
            <div id="logo">
                <h1><a href="#">Cats_world </a></h1>
                <p>Мир котов </p>
            </div>
        </div>
    </div>
    <!-- end #header -->
    <div id="page">
        <div id="page-bgtop">
            <div id="page-bgbtm">
                <div id="content">
                    <div class="post">
                        <h2 class="title">{{ news.title }}</h2>
                        <p class="meta"> on {{ news.date }}
                            <div class="entry">
                        <p><img src="/public/{{ news.photo }}" width="800" height="300" alt=""/></p>
                        {{ news.text }}
                    </div>
                    <div class="comBlock">
                        {% for com in Comments %}
                            <div class="commentBlock" id="comment-{{ com.getId() }}">
                                <div class="comment"><strong>{{ com.comment }}</strong><br>{{ com.date }}
                                    <div id="delete">
                                        {% if session.get('authorization')===1 %}
                                            <a href="/news/del/{{ com.getId() }}"
                                               onclick="document.getElementById('myform2-{{ com.getId() }}').submit(); return false;">Удалить</a>
                                            <form method="post" action="/news/del/{{ com.getId() }}" id="myform2-{{ com.getId() }}">
                                                <input type="hidden" name="current_url"
                                                       value="{{ router.getRewriteUri() }}">
                                            </form>
                                        {% endif %}
                                    </div>
                                    {% if session.get('authorization')!==null %}
                                        <div class="toggle">
                                            <div class="content">
                                                <form action="/news/detail" method="post" class="comment_form" >
                                                    <input type="hidden" name="parent_id" class="parent_id"
                                                           value="{{ com.getId() }}">
                                                    {{ form1.render("comment") }}
                                                    <input type="hidden" name="date" class="date"
                                                           value="{{ date('Y-m-d') }} ">
                                                    <input type="hidden" name="news_id" class="news_id"
                                                           value="{{ news.id }}">
                                                    <input type="hidden" name="current_url"
                                                           value="{{ router.getRewriteUri() }}">
                                                    <p><input name="button2" type="submit" value="Отправить">
                                                        <span class="resp"></span></p>
                                                </form>
                                            </div>
                                            <a class="toggler" href="#">Ответить</a>
                                        </div>
                                    {% endif %}
                                </div>
                                {% for comm in comments %}
                                    {% if comm.getParentId() == com.getId() %}
                                        <div class="answer"><strong>{{ comm.comment }}</strong><br>{{ comm.date }}<br>{{  comm.getId() }}
                                            <div id="delete">
                                                {% if session.get('authorization')===1 %}
                                                    <a href="/news/del/{{ comm.getId() }}"
                                                       onclick="document.getElementById('myform3-{{ comm.getId() }}').submit(); return false;">Удалить</a>
                                                    <form method="post" action="/news/del/{{ comm.getId() }}" id="myform3-{{ comm.getId() }}">
                                                        <input type="hidden" name="current_url"
                                                               value="{{ router.getRewriteUri() }}">
                                                    </form>
                                                {% endif %}
                                            </div>
                                        </div>
                                    {% endif %}
                                {% endfor %}
                            </div>
                        {% endfor %}
                    </div>

                    <form action="/news/detail" method="post" class="comment_form">
                        {% if session.get('authorization')!==null %}
                            <input type="hidden" name="parent_id" class="parent_id" value=0>
                            {{ form1.render("comment") }}
                            <input type="hidden" name="date" class="date" value="{{ date('Y-m-d') }} ">
                            <input type="hidden" name="news_id" class="news_id" value="{{ news.id }}">
                            <input type="hidden" name="current_url" value="{{ router.getRewriteUri() }}">
                            <p><input name="button" type="submit" value="Отправить">
                                <span class="resp"></span></p>
                        {% endif %}
                    </form>
                </div>
                <a href='/index' class="permalink">Вернуться домой</a>
                <div style="clear: both;">&nbsp;</div>
            </div>
            <!-- end #content -->
            <div style="clear: both;">&nbsp;</div>
        </div>
    </div>
</div>
<!-- end #page -->
</div>
<div id="footer">
    <p>Copyright (c) 2013 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org">FCT</a>.
        Photos by Fotogrph</a>.</p>
</div>
<!-- end #footer -->
</body>
</html>

