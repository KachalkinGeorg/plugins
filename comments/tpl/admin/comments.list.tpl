<div class="panel panel-default panel-table">
    <div class="panel-heading">
        <!-- Filter form: BEGIN -->
		<form method="get">
			<input type="hidden" name="mod" value="extra-config"/>
			<input type="hidden" name="plugin" value="comments"/>
			<input type="hidden" name="action" value="list" />
        <div class="row" style="padding: 0.95rem 0rem .25rem 0rem">
            <!--Block 1-->
            <div class="col col-md-3 col-sm-6">
				<div class="input-group mb-3">
					<div class="input-group-prepend input-group-append">
						<label class="input-group-text"><i class="fa fa-comments-o"></i></label>
					</div>
					{{ approve }}
				</div>
            </div>
            <!--/Block 1-->
            <!--Block 2-->
            <div class="col col-md-3 col-sm-6">
				<div class="input-group mb-3">
					<div class="input-group-prepend input-group-append">
						<label class="input-group-text"><i class="fa fa-user"></i></label>
					</div>
					<input type="text" id="author" name="author" value="{{ author }}" placeholder="автор" class="form-control" style="max-width:220px;"/>
				</div>
            </div>
            <!--/Block 2-->
            <!--Block 3-->
            <div class="col col-md-3 col-sm-6">
				<div class="input-group mb-3">
					<div class="input-group-prepend input-group-append">
						<label class="input-group-text"><i class="fa fa-low-vision"></i></label>
					</div>
					<input type="number" id="rpp" name="rpp" value="{{ rpp }}" placeholder="автор" class="form-control" style="max-width:220px;"/>
				</div>
            </div>
            <!--/Block 3-->
            <div class="col col-md-3 col-sm-6">
                    <span class="input-group-btn">
                        <button type="submit" name="filter" value="true" class="btn btn-primary form-control">{{ lang['comments:view'] }}</button>
                    </span>
			 </div>
        </div>
		</form>
    </div>
    <!-- Filter form: END -->
    <!-- List of comments: BEGIN -->
	<form method="post" name="select_comments">
    <div class="panel-body table-responsive">
        <table class="table table-condensed">
            <thead>
                <tr>
                    <th>#</th>
                    <th></th>
                    <th>{{ lang['comments:comment'] }}</th>
                    <th>{{ lang['comments:news'] }}</th>
                    <th>{{ lang['comments:author'] }}</th>
                    <th>{{ lang['comments:date'] }}</th>
					<th><input class="check" type="checkbox" name="master_box" title="{{ lang['select_all'] }}" onclick="javascript:check_uncheck_all(select_comments)"/></th>
                </tr>
            </thead>
            <tbody>
            {% for item in items %}
                <tr>
                    <td>{{ item.id }}</td>
                    <td>{% if item.isApprove %}<i class="fa fa-check text-success"></i>{% else %}<i class="fa fa-times text-danger"></i>{% endif %}</td>
                    <td style="white-space: nowrap;"><a href="admin.php?mod=extra-config&plugin=comments&action=edit&comid={{ item.id }}">{{ item.text }}</a></td>
                    <td><a href="{{ item.link }}" target="_blank">{{ item.title }}</a></td>
                    <td>{% if item.authorLink %}<a href="{{ item.authorLink }}" target="_blank">{{ item.author }}</a>{% else %}{{ item.author }}{% endif %}</td>
                    <td><span title="{{ item.postdate }}">{{ item.postdateStamp|cdate }}</span></td>
					<td><input name="selected_comments[]" value="{{ item.id }}" type="checkbox" /></td>
                </tr>
            {% else %}
                <tr><td colspan="8">{{ lang['comments:no_comments'] }}</td></tr>
            {% endfor %}
            </tbody>
        </table>
    </div>
    <div class="panel-footer">
        <div class="row">
            <div class="col col-md-8 text-right">
                {{ pagesss }}
            </div>
            <div class="col col-md-4">
                <!--{ % if flags.allow_modify % }-->
                <div class="input-group">
                    <select name="subaction" class="form-control">
                        <option value="">-- {{ lang['comments:actions'] }} --</option>
                        <option value="" class="divider" disabled>===================</option>
                        <option value="mass_approve">{{ moder1 }}</option>
                        <option value="mass_forbidden">{{ moder2 }}</option>
                        <option value="" class="divider" disabled>===================</option>
                        <option value="mass_delete">{{ lang['comments:delete'] }}</option>
                    </select>
                    <span class="input-group-btn">
                        <button type="submit" name="mass_action" value="true" class="btn btn-default">ok</button>
                    </span>
                </div>
                <!--{ % endif % }-->
            </div>
        </div>
    </div>
	
	</form>
	
</div>