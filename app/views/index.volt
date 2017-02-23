<!DOCTYPE html>
<html>
    {% include 'blocks/head.volt' %}
    {% include 'blocks/nav.volt' %}
    <body>
        <div class="container">
            {{ content() }}
        </div>
        {% include 'blocks/footer.volt' %}
    </body>
</html>
