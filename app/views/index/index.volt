{% block content %}{% endblock %}
{{ partial('parts/head') }}
<div class="main-container">
    <div class="b-page__b-news__search">
        <form action="/news/search" method="post">
        <input class="search__input" type="text" name="search" placeholder="Поиск...">
        <button class="search__button"></button>
        </form>
    </div>
</div>

<div id="wrapper">
    {% for item in page.items %}
    {% set cat = categories[item.getCatId()] %}
    <div class="b-page__b-news main-container">
        <section class="b-news__news-item">

            <div class="news-item__b-date">
                 <span class="news-item__b-date__date">{{ item.getDate() }}</span>
            </div>
            <div class="b-news__news-item__b-top">
                <div class="news-item__b-author">
                    <a  class="news-item__b-author__a-author">
                        <span class="news-item__b-author__autor">Автор</span>
                    </a>
                </div>
                <div class="news-item__b-category">
                    <a  class="news-item__b-category__a-category">
                        <span class="news-item__b-category__category">{{ cat.getName() }}</span>
                    </a>
                </div>
            </div>
            <a href="/{{ cat.getUrl() }}/{{ item.getUrl() }}" class="news-item__a-news-item">
                <div class="news-item__b-img">
                    <img src="/public/{{ item.getPhoto() }}" class="news-item__b-img__img">
                </div>
                <div class="news-item__b-title">
                    <span class="news-item__b-title__title">{{ item.getTitle() }}</span>
                </div>
                <div class="news-item__b-text">
                    <p class="news-item__b-text__text">{{ item.getDesc() }}</p>
                </div>

                <div class="news-item__b-bottom">
                    <span class="news-item__b-bottom__like">10</span>
                    <span class="news-item__b-bottom__comment">10</span>
                </div>
            </a>
        </section>
    </div>
         {% endfor %}

    {% if page.total_pages > 1 %}
        <ul class="b-page__b-news__numbers">
            {% for i in 1..page.total_pages %}
                <li class="numbers__li">
                    <a href="/index?page={{ i }}" class="numbers__li__a">{{ i }}</a>
                </li>
            {% endfor %}
        </ul>
    {% endif %}
</div>
<footer class="b-page__b-footer">
    <div class="main-container">
        <div class="b-page__b-footer__b-text">© 2017, «Блог программиста»</div>
    </div>
</footer>