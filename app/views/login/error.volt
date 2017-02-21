<h2>
    <div class="zag">Ошибка!</div>
</h2>
<br>

<div id="errors">
    {% set count = 0 %}
    {% for message in form.getMessages() %}
        <ul type="circle">
            <li>{{ message.getMessage() }} </li>
        </ul>
        {% set count=count+1 %}
    {% endfor %}

    {% if count===0 %}
        {{ "Вы ввели неправильный логин или пароль" }}
    {% endif %}
</div>
<div class="errorMessage">
    <p><a href="/index">Попробуйте снова </a></p>
</div>


