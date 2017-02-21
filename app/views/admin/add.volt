<h2 class="zag">
    Форма добавления новости:
</h2>

<form action="/admin/add" method="post" enctype = 'multipart/form-data'>

    <label for="title">
        Заголовок:
    </label>
    <p>{{ form.render("title") }}</p>

    <label for="key">
        Keywords:
    </label>

    <p>{{ form.render("key") }}</p>
    <label for="$desc">
        Краткая информация:
    </label>

    <p>{{ form.render("desc") }}</p>

    <label for="photo">
        Фото:
    </label>

    <p>{{ form.render("photo") }}</p>

    <label for="text">
        Текст:
    </label>

    <p> {{ form.render("text") }}</p>

    <label for="date">
        Дата:
    </label>

    <p>{{ form.render("date") }}</p>

    <p>{{ form.render("url") }}</p>

    <label for="cat_id">
        Категория:
    </label>

    <p> {{ form.render("cat_id") }} </p>

    <p>{{ submit_button("Добавить") }}</p>

    <div id="errors">
        {% for message in form.getMessages() %}
            <p>{{ message.getMessage() }}</p>
        {% endfor %}
    </div>

    <div id="errors">
        {% set messages = news.getMessages() %}
        {% if messages !== null %}
            {% for message in news.getMessages() %}
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

