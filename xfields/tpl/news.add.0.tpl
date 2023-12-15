{% if (entryCount > 0) %}
<tr class="thead-light">
	<th colspan="2">
		{{ lang['xfields_group_title'] }} {{ entryCount }}
		<span id="xf_profile"></span>
	</th>
</tr>
{% endif %}

{% for entry in entries %}
<tr id="xfl_{{ entry.id }}">
	<td valign="top">{{ entry.title }}{% if entry.flags.required %} <b>(*)</b>{% endif %}:</td>
	<td valign="top">{{ entry.input }}</td>
</tr>
{% endfor %}

{% if (flags.tdata) %}
<tr class="thead-light">
	<th colspan="2">Табличные данные</th>
</tr>
	<th colspan="2" style="padding: 0px;">
		<table id="tdataTable" class="table table-sm table-bordered mb-0">
			<thead>
				<tr>
					<th>#</th>
					{% for entry in xtableHdr %}
					<th>{{ entry.title }}</th>
					{% endfor %}
					<th>Действие</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="{{ (xtablecnt+2) }}" class="text-right" style="padding-right: 22px;">
						<button type="button" title="Добавить строки" onclick="tblLoadData(0);" class="btn btn-sm btn-primary"><i class="fa fa-plus"></i></button>
					</td>
				</tr>
			</tfoot>
		</table>
	</th>
</tr>
{% endif %}