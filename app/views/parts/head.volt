<script>
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();
    });
</script>
<script type="text/javascript" src="/public/js/head.js"></script>
<link href="/public/css/modal.css" rel="stylesheet" type="text/css"/>
{% set categories = this.header.header()['ct'] %}
{% set form = this.header.header()['form'] %}
<body class="b-page">

<form method="post" action="/login/logout" id="myform">
    <input type="hidden" name="current_url" value="{{ router.getRewriteUri() }}">
</form>
<a href="#x" class="overlay" id="login_form"></a>

<div id="login_form" class="modal">
    <div class="modal-content">
        <h4>Авторизация</h4>
        <form method="post" id='logform' action="/index">
            <div>
                <label for="login">Логин</label>
                {{ form.render("login") }}
            </div>
            <div>
                <label for="password">Пароль</label>
                {{ form.render("pass") }}
            </div>
            <input type="hidden" name="current_url" id=current_url value="{{ router.getRewriteUri() }}">
            <a class="btn" href="/signUp">Регистрация</a>
            <div class="form_err" style="display:none;">Неверный логин или пароль</div>
            <input class="btn" name="button" type="submit" value="Авторизоваться" id="send">
            <span id="resp1"></span>
        </form>
    </div>
</div>
