{{ partial('parts/head') }}

<nav>
    <div class="nav-wrapper">
        <div class="col s12">
            <a style="margin-left: 15px;" href="/index" class="breadcrumb">Home</a>
            <a href="/admin/" class="breadcrumb">Список новостей</a>
        </div>
    </div>
</nav>

<div>
    <ul class="collection">
        {% for item in page.items %}
            <li class="collection-item avatar">
                <i class="material-icons circle">assignment_ind</i>
                <span class="title"><a href="mailto:{{ item.email }}">{{ item.email }}</a></span>
                <p>Логин: {{ item.login }} <br>
                    Имя: {{ item.name | capitalize }}
                </p>
                <p>
                    Телефон: {{ item.phone }}
                </p>
                <p> Дата рождения: {{ item.date }}
                </p>
                <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
            </li>
        {% endfor %}
    </ul>
</div>
<div class="center" style="margin: 20px 0 20px 0;">
    <a href="/admin/users/index?page={{ page.before }}"> Предыдущая </a>
    {{ "Вы на странице " ~ page.current  ~ " из " ~ page.total_pages }}
    <a href="/admin/users/index?page={{ page.next }}"> Следующая </a>
</div>
