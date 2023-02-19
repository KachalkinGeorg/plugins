{% if not(entries|length) %}
<div class="alert alert-info">
	<h5>{{ lang['msgi_info'] }}</h5>
	<p>{{ lang['feedback:no_forms'] }}</p>
	<hr>
	<a href="?mod=extra-config&plugin=feedback&action=addform" class="alert-link- btn btn-outline-success">{{ lang['feedback:create_new_form'] }}</a>
</div>
{%else%}

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-md-6">
				<!--  -->
			</div>
			<div class="col-md-6 text-md-right">
				<a href="?mod=extra-config&plugin=feedback&action=addform" class="btn btn-outline-success">{{ lang['feedback:create_new_form'] }}</a>
			</div>
		</div>
	</div>

	<div class="table-responsive">
		<table class="table table-sm mb-0">
			<thead>
				<tr>
					<th>#</th>
					<th>{{ lang['feedback:form_name'] }}</th>
					<th>{{ lang['feedback:form_title'] }}</th>
					<th>{{ lang['feedback:link_to_news'] }}</th>
					<th>{{ lang['feedback:is_active'] }}</th>
					<th class="text-right">{{ lang['feedback:actions'] }}</th>
				</tr>
			</thead>
			<tbody>
			{% for entry in entries %}
				<tr>
					<td>{{ entry.id }}</td>
					<td><a href="{{ entry.linkEdit }}">{{ entry.name }}</a></td>
					<td>{{ entry.title }}</td>
					<td>{{ lang['feedback:link_to_news_' ~ entry.link_news] }}</td>
					<td>
						{% if (entry.flags.active) %}
							<i class="fa fa-check text-success" title="{{ lang['yesa'] }}"></i>
						{% else %}
							<i class="fa fa-times text-danger" title="{{ lang['noa'] }}"></i>
						{% endif %}
					</td>
					<td class="text-right" nowrap>
						<div class="btn-group btn-group-sm" role="group">
							{% if (entry.flags.active) %}
								<a onclick="alert('{{ lang['feedback:msg_unable_to_delete_active_form'] }}');" class="btn btn-outline-danger">
									<i class="fa fa-trash"></i>
								</a>
							{% else %}
								<a href="#" data-toggle="modal" data-target="#modal-{{ entry.id }}" class="btn btn-outline-danger">
									<i class="fa fa-trash"></i>
								</a>
	<div id="modal-{{ entry.id }}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="{{ entry.id }}-modal-label" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 id="{{ entry.id }}-modal-label" class="modal-title">{{ lang['feedback:msg_you_sure'] }}</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times-circle"></i></span></button>
				</div>
				<div class="modal-body">
					Вы уверены, что хотите удалит категорию {{ entry.name }}?<br>Данное действие необратимо!
				</div>
				<div class="modal-footer"> <a href="{{ entry.linkDel }}" class="btn btn-outline-success">да</a> <button type="button" class="btn btn-outline-dark" data-dismiss="modal">отмена</button></div>
			</div>
		</div>
	</div>
							{% endif %}
						</div>
					</td>
				</tr>
			{% endfor %}
			</tbody>
		</table>
	</div>
</div>
{% endif %}