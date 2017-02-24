<!DOCTYPE html>
<html>
{% if 'admin/add' in router.getRewriteUri() %}
{% elseif 'admin/edit' in router.getRewriteUri() %}
{% else %}
    {% include 'blocks/head.volt' %}
    {% include 'blocks/nav.volt' %}
{% endif %}
<body>
<div class="container">
    {{ content() }}
</div>
{% if 'admin/add' in router.getRewriteUri() %}
{% elseif 'admin/edit' in router.getRewriteUri() %}
{% else %}
    {% include 'blocks/footer.volt' %}
{% endif %}
</body>
</html>
