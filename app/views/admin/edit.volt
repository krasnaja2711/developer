<style>
    body {
        background-color: #e0e0e0;
    }

    .zag {
        color: #737373;
    }

    .form_create {
        margin-bottom: 30px;
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
        $('#redactor').redactor({
            plugins: ['table', 'video', 'source'],
            buttons: ['format', 'bold', 'italic', 'deleted', 'lists',
                'image', 'file', 'link', 'horizontalrule'],
            formatting: ['p', 'blockquote', 'pre', 'h1', 'h2', 'h3', 'h4', 'h5'],
            placeholder: 'Enter a news...',
            minHeight: 300,
            imagePosition: true,
            imageResizable: true
        });
        $("#datepicker").datepicker({dateFormat: "yy-mm-dd"});
    });
</script>
<h2 class="zag center">
    Форма редактирования новости:
</h2>
<div class="form_create">
    <form action="/admin/edit/{{ news.getUrl() }}" method="post" enctype='multipart/form-data'>
        <label for="title">
            Заголовок:
        </label>
        <p> {{ form.render("title") }}</p>

        <label for="key">
            Keywords:
        </label>

        <p> {{ form.render("key") }}</p>

        <label for="$desc">
            Краткая информация:
        </label>

        <p> {{ form.render("desc") }}</p>

        <label for="photo">
            Фото:
        </label>

        <p>{{ form.render("photo") }}

        <p>
            <label for="text">
                Текст:
            </label>
        </p>

        <p>{{ form.render("text") }}</p>

        <label for="date">
            Дата:
        </label>

        <p>{{ form.render("date") }}</p>

        {{ form.render("url") }}

        <label for="cat_id">
            Категория:
        </label>
        <p>{{ form.render("cat_id") }}</p>
        <p>{{ submit_button("Сохранить") }}</p>

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
</div>
