<form name="form" method="post">
<div class="panel panel-default">
		
	<div class="panel-heading" style="padding: 0px;margin-bottom: 0;">
		<ul class="nav nav-tabs nav-fill">
			<li class="nav-item"><a href="#userTabs-com" class="nav-link active" data-toggle="tab"><span data-toggle="popover" data-placement="top" data-trigger="hover focus" data-content="{{ lang['comments:group.general'] }}"><i class="fa fa-database"></i> {{ lang['comments:general'] }}</span></a></li>
			<li class="nav-item"><a href="#userTabs-global" class="nav-link" data-toggle="tab"><span data-toggle="popover" data-placement="top" data-trigger="hover focus" data-content="{{ lang['comments:group.default'] }}"><i class="fa fa-lock"></i> {{ lang['comments:default'] }}</span></a></li>
			<li class="nav-item"><a href="#userTabs-multi" class="nav-link" data-toggle="tab"><span data-toggle="popover" data-placement="top" data-trigger="hover focus" data-content="{{ lang['comments:group.multipag'] }}"><i class="fa fa-th-large"></i> {{ lang['comments:multipag'] }}</span></a></li>
			<li class="nav-item"><a href="#userTabs-inform" class="nav-link" data-toggle="tab"><span data-toggle="popover" data-placement="top" data-trigger="hover focus" data-content="{{ lang['comments:group.inform'] }}"><i class="fa fa-bullhorn"></i> {{ lang['comments:inform'] }}</span></a></li>
		</ul>
	</div>
	
	<div class="panel-body">
		<div class="tab-content">
		
		<div id="userTabs-com" class="tab-pane show active">
			<table class="table table-striped">
				<tr>
					<td width="50%">{{ lang['comments:regonly'] }} <small class="form-text text-muted">{{ lang['comments:regonly#desc'] }}</small></td>
					<td width="50%">{{ regonly }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:moderate'] }} <small class="form-text text-muted">{{ lang['comments:moderate#desc'] }}</small></td>
					<td width="50%">{{ moderate }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:guest_edup_lock'] }} <small class="form-text text-muted">{{ lang['comments:guest_edup_lock#desc'] }}</small></td>
					<td width="50%">{{ guest_edup_lock }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:backorder'] }} <small class="form-text text-muted">{{ lang['comments:backorder#desc'] }}</small></td>
					<td width="50%">{{ backorder }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:minlen'] }} <small class="form-text text-muted">{{ lang['comments:minlen#desc'] }}</small></td>
					<td width="50%"><input id="minlen" type="text" name="minlen" value="{{ minlen }}" class="form-control" style="max-width:150px; text-align: center;"/></td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:maxlen'] }} <small class="form-text text-muted">{{ lang['comments:maxlen#desc'] }}</small></td>
					<td width="50%"><input id="maxlen" type="text" name="maxlen" value="{{ maxlen }}" class="form-control" style="max-width:150px; text-align: center;"/></td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:maxwlen'] }} <small class="form-text text-muted">{{ lang['comments:maxwlen#desc'] }}</small></td>
					<td width="50%"><input id="maxwlen" type="text" name="maxwlen" value="{{ maxwlen }}" class="form-control" style="max-width:150px; text-align: center;"/></td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:multi'] }} <small class="form-text text-muted">{{ lang['comments:multi#desc'] }}</small></td>
					<td width="50%">{{ multi }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:author_multi'] }} <small class="form-text text-muted">{{ lang['comments:author_multi#desc'] }}</small></td>
					<td width="50%">{{ author_multi }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:timestamp'] }} <small class="form-text text-muted">{{ lang['comments:timestamp#desc'] }}</small></td>
					<td width="50%"><input id="timestamp" type="text" name="timestamp" value="{{ timestamp }}" class="form-control" style="max-width:150px; text-align: center;"/></td>
				</tr>
			</table>
		</div>
	
		<div id="userTabs-global" class="tab-pane">
			<table class="table table-striped">
				<tr>
					<td width="50%">{{ lang['comments:global_default'] }} <small class="form-text text-muted">{{ lang['comments:global_default#desc'] }}</small></td>
					<td width="50%">{{ global_default }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:default_news'] }} <small class="form-text text-muted">{{ lang['comments:default_news#desc'] }}</small></td>
					<td width="50%">{{ default_news }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:default_categories'] }} <small class="form-text text-muted">{{ lang['comments:default_categories#desc'] }}</small></td>
					<td width="50%">{{ default_categories }}</td>
				</tr>
			</table>
		</div>
	
		<div id="userTabs-multi" class="tab-pane">
			<table class="table table-striped">
				<tr>
					<td width="50%">{{ lang['comments:multipage'] }} <small class="form-text text-muted">{{ lang['comments:multipage#desc'] }}</small></td>
					<td width="50%">{{ multipage }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:multi_mcount'] }} <small class="form-text text-muted">{{ lang['comments:multi_mcount#desc'] }}</small></td>
					<td width="50%"><input id="multi_mcount" type="text" name="multi_mcount" value="{{ multi_mcount }}" class="form-control" style="max-width:150px; text-align: center;"/></td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:multi_scount'] }} <small class="form-text text-muted">{{ lang['comments:multi_scount#desc'] }}</small></td>
					<td width="50%"><input id="multi_scount" type="text" name="multi_scount" value="{{ multi_scount }}" class="form-control" style="max-width:150px; text-align: center;"/></td>
				</tr>
			</table>
		</div>

		<div id="userTabs-inform" class="tab-pane">
			<table class="table table-striped">
				<tr>
					<td width="50%">{{ lang['comments:inform_author'] }} <small class="form-text text-muted">{{ lang['comments:inform_author#desc'] }}</small></td>
					<td width="50%">{{ inform_author }}</td>
				</tr>
				<tr>
					<td width="50%">{{ lang['comments:inform_admin'] }} <small class="form-text text-muted">{{ lang['comments:inform_admin#desc'] }}</small></td>
					<td width="50%">{{ inform_admin }}</td>
				</tr>
			</table>
		</div>
	
		<div class="panel-footer" style="margin-left: -20px;margin-right: -20px;margin-bottom: -20px;">
			<center><button type="submit" name="submit" class="btn btn-outline-success">{{ lang['comments:save'] }}</button></center>
		</div>		
	
  		</div>
	</div>
</div>

</form>