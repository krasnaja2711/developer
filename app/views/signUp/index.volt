<h2 class="zag">
    Регистрация:
</h2>
<br>
<form action="signUp" method="post">

        <label for="name">
           Login:
        </label>

    <p> {{ form.render("login") }} </p>


        <label for="name">
            Имя:
        </label>

    <p> {{ form.render("name") }}</p>


        <label for="pass">
            Пароль:
        </label>

    <p>  {{ form.render("pass") }}</p>


        <label for="email">
            E-Mail:
        </label>

    <p>  {{ form.render("email") }}</p>


        <label for="phone">
            Телефон:
        </label>
    <p>  {{ form.render("phone") }}</p>


        <label for="date">
            Дата:
        </label>
    <p>  {{ form.render("date") }}</p>

    {{ form.render("id_roles") }}
    <p>
        {{ submit_button("Зарегистрироваться") }}
    </p>

    <div id="errors">
        {% for message in form.getMessages() %}
            <p>{{ message.getMessage() }}</p>
        {% endfor %}
    </div>

    <div id="errors">

        {% set messages = users.getMessages() %}
        {% if messages !== null %}
            {% for message in users.getMessages() %}
                <p>{{ message.getMessage() }}</p>
            {% endfor %}
        {% endif %}

    </div>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $("#datepicker").datepicker({dateFormat: "yy-mm-dd"});
    });
</script>