<div class="navbar-default navbar-component">
<ul class="nav nav-tabs nav-fill mb-3 d-md-flex d-block">
	<li class="nav-item"><a href="#" class="nav-link {active1}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=subscribe_comments'"><span data-toggle="tooltip" data-placement="top" title="Общие настройки"><i class="fa fa-cog"></i> Общие настройки</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {active2}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=subscribe_comments&action=list_subscribe'"><span data-toggle="tooltip" data-placement="top" title="Список подписчиков"><i class="fa fa-list-ul"></i> Список подписчиков</span></a></li>
	[hide_delayed]<li class="nav-item"><a href="#" class="nav-link {active3}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=subscribe_comments&action=list_subscribe_post'"><span data-toggle="tooltip" data-placement="top" title="Сформированные письма"><i class="fa fa-envelope"></i> Сформированные письма</span></a></li>[/hide_delayed]
</ul>
</div>

<div class="panel panel-default">
  <div class="panel-heading">
     {panel}
  </div>
<div class="panel-body">
	{entries_cron}

	{entries}

</div>

</div>