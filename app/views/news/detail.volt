{{ partial('parts/head') }}

<style>
    .answer {
        border: 1px solid #666;
        margin: 10px 10px 10px 30px;
        padding: 25px;
        font-family: monospace;
        font-size: 12px;
        border-radius: 5px;
        box-shadow: 2px 2px 2px #999;
    }
</style>
<script>
    $('.chips').material_chip();
    $(function () {
        $('a.toggler').click(function () {
            $('.answers').css({'padding-top': '20px'});
        })
    });
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
                            $('.rating').html("Рейтинг:" + (+response));
                            $this.data('key', 'disLike').html('<i class="material-icons">thumb_down</i>');
                            break;

                        case 'disLike':
                            $(' .rating').html("Рейтинг:" + (+response ));
                            $this.data('key', 'like').html('<i class="material-icons">thumb_up</i>');
                            break;
                    }
                }
            });
        });
    });

</script>

<div class="card">
    <div class="card-image waves-effect waves-block waves-light">
        <img class="activator" src="/public/{{ news.getPhoto() }}">
        <span class="card-title">{{ news.getTitle() }}</span>
    </div>
    <div class="card-content">
        <p style="margin-bottom: 2px; color: #5099ff;">Автор - Unknown</p>
        <p style="margin-bottom: 2px; color: #5099ff;">Дата: {{ news.getDate() }}</p>
        <input type="hidden" id="rating" value="{{ rating }} ">
        <p class="rating" style="margin-bottom: 2px; color: #5099ff;">Рейтинг: {{ rating }}</p>
        {% if (like==false) %}
            <a class="like-disLike" data-key="like"><i class="material-icons">thumb_up</i></a>
        {% else %}
            <a class="like-disLike" data-key="disLike"><i class="material-icons">thumb_down</i></a>
        {% endif %}
        {% if Tags|length %}
            <p style="margin-bottom: 2px; color: #5099ff;">Теги:</p>
            {% for tegger in Tags %}
                <div class="chip" style="margin-top: 10px;">
                    <a style="color: #222222;" href="/tags/{{ tegger.name }}"> {{ tegger.name }}</a>
                </div>
            {% endfor %}
        {% endif %}
        <p style="margin-top: 10px;">{{ news.text }}</p>
    </div>
</div>


<div class="b-page__b-news main-container">
    <section class="b-news__news-item">

        <div class="news-item__b-date">
            <span class="news-item__b-date__date">{{ news.getDate() }}</span>
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
                                    <button class="right btn waves-effect waves-light" type="submit" name="button2">
                                        Отправить
                                        <i class="material-icons right">send</i>
                                    </button>
                                </form>
                            </div>
                            <a class="toggler" href="#">Ответить</a>
                        </div>
                    {% endif %}
                    <div class="answers">
                        {% for comm in comments %}
                            {% if comm.getParentId() == com.getId() %}
                                <div class="answer">
                                    <p class="left">
                                        <strong>{{ comm.comment }}</strong>
                                    </p>
                                    <div class="right">{{ comm.date }}</div>
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
                <button class="btn waves-effect waves-light" type="submit" name="button2">Отправить
                    <i class="material-icons right">send</i>
                </button>
            {% endif %}
        </form>

    </section>
</div>


