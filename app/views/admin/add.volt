<script>
    $(function () {
        $(".tag_form").submit(function (e) {
            e.preventDefault();
            var tag_id = $(this).find(".tag_id").val(),
                news_id = $(this).find(".news_id").val();
            $.ajax({
                type: "POST",
                url: "/admin/addTag",
                data: {"news_id": news_id, "tag_id": tag_id},
                cache: false,
                success: function () {

                }
            });
        });
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
        var queryDate = new Date();
        var realDate = new Date(queryDate[0], queryDate[1] - 1, queryDate[2]);
        $('#datePicker').datepicker('setDate', realDate);
    });
</script>
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
<h2 class="zag center">
    Форма добавления новости
</h2>
<div class="form_create">
    <form action="/admin/add" method="post" enctype='multipart/form-data' class="news">
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
        <input type="hidden" name="user_id" value={{ session.get('user_id') }}>
        <div class="tags" style="display: none">
            Теги:
            {% for tagger in tags %}
                <form method="post" action="/admin/addTag" class="tag_form">
                    <input type="hidden" name="news_id" class="news_id" value="{{ maxId.getId() }}">
                    <input type="hidden" name="tag_id" class="tag_id" value="{{ tagger.getId() }}">
                    <input name="button" type="submit" value="{{ tagger.getName() }}">
                </form>
            {% endfor %}
        </div>
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
</div>
