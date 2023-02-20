{% if (flags.can_publish) %}
<div class="input-group">
	<input type="text" placeholder="Дата включения..." name="nsched_activate" value="{{ nsched_activate }}" autocomplete="off" class="form-control" />
	<div class="input-group-append">
		<a class="btn btn-outline-primary" data-toggle="popover" data-placement="top" data-trigger="focus" data-html="true" title="" data-content="Используется формат типа:<br />ДД.ММ.ГГГГ ЧЧ:ММ" tabindex="0" data-original-title="ДАТА ВКЛЮЧЕНИЯ">
			<i class="fa fa-question"></i>
		</a>
	</div>
</div>
<small>( в формате ДД.ММ.ГГГГ ЧЧ:ММ )</small>
{% endif %}

{% if (flags.can_unpublish) %}
<div class="input-group">
	<input type="text" placeholder="Дата отключения..." name="nsched_deactivate" value="{{ nsched_deactivate }}" autocomplete="off" class="form-control" />
	<div class="input-group-append">
		<a class="btn btn-outline-primary" data-toggle="popover" data-placement="top" data-trigger="focus" data-html="true" title="" data-content="Используется формат типа:<br />ДД.ММ.ГГГГ ЧЧ:ММ" tabindex="0" data-original-title="ДАТА ОТКЛЮЧЕНИЯ">
			<i class="fa fa-question"></i>
		</a>
	</div>
</div>
<small>( в формате ДД.ММ.ГГГГ ЧЧ:ММ )</small>
{% endif %}

<script>
    $('[name="nsched_activate"]').datetimepicker({
        format: '{{ format_datetime }}',
        currentText: '{{ nsched_activate }}',
    });

    $('[name="nsched_deactivate"]').datetimepicker({
        format: '{{ format_datetime }}',
        currentText: '{{ nsched_deactivate }}',
    });
</script>