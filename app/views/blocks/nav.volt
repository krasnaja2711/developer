<style>
    .brand-logo > img {
        width: 65px;
    }
    .search {
        margin-top: 25px;
    }
    .active {
        padding: 0 0 0 0 !important;
        background-color: #fff;
        box-shadow: 0 0 1px rgba(255, 255, 255, 0);
    }
</style>
<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper">
            <a href="/" class="brand-logo">
                <img class="logo_devel" src="/img/logo.png" alt="Logo">
            </a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                {% for cat in categories %}
                    {% if cat.getUrl() in router.getRewriteUri() %}
                        <li class="active"><a href="/{{ cat.getUrl() }}">{{ cat.getName() }}</a></li>
                    {% else %}
                        <li><a href="/{{ cat.getUrl() }}">{{ cat.getName() }}</a></li>
                    {% endif %}
                {% endfor %}
                {% if session.get('authorization') === 1 %}
                    {% if '/admin' in router.getRewriteUri() %}
                        <li class="active"><a href="/admin">Админ</a></li>
                    {% else %}
                        <li><a href="/admin">Админ</a></li>
                    {% endif %}
                {% elseif (session.get('authorization') === 2) %}
                    <li><a href="/blog">{{ session.get('login') }}</a></li>
                {% endif %}
                {% if session.get('authorization') !== null %}
                    <li><a href="/login/logout"
                       onclick="document.getElementById('myform').submit(); return false;"
                       id="login_pop">Выйти</a></li>
                {% else %}
                    <li><a href="#login_form" id="login_pop">Войти</a></li>
                {% endif %}
            </ul>
        </div>
    </nav>
</div>
<div class="container">
    <div class="row">
        <div class="s12 m4 l8">
            <nav class="search">
                <div class="nav-wrapper">
                    <form method="POST" action="/news/search">
                        <div class="input-field">
                            <input id="search" name="search" type="search" required>
                            <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                            <i class="material-icons">close</i>
                        </div>
                    </form>
                </div>
            </nav>
        </div>
    </div>
</div>