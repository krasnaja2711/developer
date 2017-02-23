<script>
    $(function () {
        $('.like-disLike').click(function (e) {
            e.preventDefault();
            var news_id = $("#news_id").val(),
                    user_id = $("#user_id").val(),
                    rating = $("#rating").val(),
                    key = $(this).data('key'),
                    $this = $(this);
            $.ajax({
                type: 'POST',
                url: '/news/' + key,
                data: {'user_id': user_id, 'news_id': news_id},
                cache: false,
                success: function (response) {
                    switch (key) {
                        case 'like':
                            $('.rating p').html("Рейтинг:" + (+response));
                            $this.data('key', 'disLike').html('Не нравится');
                            break;

                        case 'disLike':
                            $('.rating p').html("Рейтинг:" + (+response ));
                            $this.data('key', 'like').html('Нравится');
                            break;
                    }
                }
            });
        });
    });

</script>
<head xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
    <meta name="keywords" content="{{ news.key }}"/>
    <meta name="description" content=" {{ news.desc }}"/>
    <script type="text/javascript" src="/public/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="/public/js/detail.js"></script>
    {{ partial('parts/head') }}
</head>

<div class="b-page__b-news main-container">
    <section class="b-news__news-item">

        <div class="news-item__b-date">
            <span class="news-item__b-date__date">{{ news.getDate() }}</span>
        </div>


        <div class="b-news__news-item__b-top">
            <div class="news-item__b-author">
                <a class="news-item__b-author__a-author">
                    <span class="news-item__b-author__autor">Автор</span>
                </a>
            </div>
        </div>
        <div class="news-item__b-title">
            <span class="news-item__b-title__title">{{ news.title }}</span>
        </div>
        <div class="news-item__b-img">
            <img src="/public/{{ news.getPhoto() }}" class="news-item__b-img__img">
        </div>
        <div class="news-item__b-text">
            <p class="news-item__b-text__text"> {{ news.text }}</p>
        </div>
        <div class="tags">
                            Теги:
                            {% for tegger in Tags %}
                                <a href="/tags/{{ tegger.name }}"> {{ tegger.name }}</a>
                            {% endfor %}
                        </div>
                        <div class="rating">
                            <input type="hidden" id="rating" value="{{ rating }} ">
                            <p> Рейтинг:{{ rating }} </p>
                            {% if (like==false) %}
                                <a class="like-disLike" data-key="like">Нравится</a>
                            {% else %}
                                <a class="like-disLike" data-key="disLike">Не нравится</a>
                            {% endif %}
                        </div>

                        {% if (like==false) %}
                            <form method="post" action="/news/like" id="likeForm">
                                <input type="hidden" name="user_id" id="user_id" value="{{ session.get('user_id') }}">
                                <input type="hidden" name="news_id" id="news_id" value="{{ news.getId() }}">
                                <input type="hidden" name="current_url"
                                       value="{{ router.getRewriteUri() }}">
                            </form>
                        {% else %}
                            <form method="post" action="/news/disLike/" id="dislikeForm">
                                <input type="hidden" name="user_id" id="user_id" value="{{ session.get('user_id') }}">
                                <input type="hidden" name="news_id" id="news_id" value="{{ news.getId() }}">
                                <input type="hidden" name="current_url"
                                       value="{{ router.getRewriteUri() }}">
                            </form>
                        {% endif %}
                        <div class="comBlock">
                            {% for com in Comments %}
                                <div class="commentBlock" id="comment-{{ com.getId() }}">
                                    <div class="comment"><strong>{{ com.comment }}</strong><br>{{ com.date }}

                                    </div>
                                    <div id="delete">
                                        {% if session.get('authorization')===1 %}
                                            <a href="/news/del/{{ com.getId() }}"
                                               onclick="document.getElementById('myform2-{{ com.getId() }}').submit(); return false;">Удалить</a>
                                            <form method="post" action="/news/del/{{ com.getId() }}"
                                                  id="myform2-{{ com.getId() }}">
                                                <input type="hidden" name="current_url"
                                                       value="{{ router.getRewriteUri() }}">
                                            </form>
                                        {% endif %}
                                    </div>
                                    {% if session.get('authorization')!==null %}
                                        <div class="toggle">
                                            <div class="content">
                                                <form action="/news/detail" method="post" class="comment_form">
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
                                    {% for comm in comments %}
                                        {% if comm.getParentId() == com.getId() %}
                                            <div class="answer"><strong>{{ comm.comment }}</strong><br>{{ comm.date }}
                                                <br>{{ comm.getId() }}
                                                <div id="delete">
                                                    {% if session.get('authorization')===1 %}
                                                        <a href="/news/del/{{ comm.getId() }}"
                                                           onclick="document.getElementById('myform3-{{ comm.getId() }}').submit(); return false;">Удалить</a>
                                                        <form method="post" action="/news/del/{{ comm.getId() }}"
                                                              id="myform3-{{ comm.getId() }}">
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

    </section>
</div>


