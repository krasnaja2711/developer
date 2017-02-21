<script type="text/javascript"  src ="/public/js/head.js"></script>
<link href="/public/css/modal.css" rel="stylesheet" type="text/css"/>
{% set  categories = this.header.header()['ct'] %}
{% set form = this.header.header()['form'] %}

<div id="menu-wrapper">
    <div id="menu">
        <ul>
            {% if session.get('authorization')!==null %}
                <a class="post" href="/login/logout" onclick="document.getElementById('myform').submit(); return false;"
                   id="login_pop"> Выйти </a> {% else %}
                <a href="#login_form" id="login_pop"> Войти </a>'
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
<a href="#x" class="overlay" id="login_form"></a>
<div class="popup">
    <form method="post"  id='logform' action="/index">
        <div>
            <label for="login">Логин</label>
            {{ form.render("login") }}
        </div>
        <div>
            <label for="password">Пароль</label>
            {{ form.render("pass") }}
        </div>
        <input type="hidden" name="current_url" id = current_url value="{{ router.getRewriteUri() }}">

        <a class="close" href="#close"></a>
        <a href="/signUp">Регистрация</a>
        <div class="form_err" style="display:none">Неверный логин или пароль</div>
        <p><input name="button" type="submit" value="Отправить" id="send"></p>
        <span id="resp1"></span>
    </form>
</div>
