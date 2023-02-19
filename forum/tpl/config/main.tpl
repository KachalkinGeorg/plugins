<div class="navbar-default navbar-component">
<ul class="nav nav-tabs nav-fill mb-3 d-md-flex d-block">
	<li class="nav-item"><a href="#" class="nav-link {{active1}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum'"><span data-toggle="tooltip" data-placement="top" title="Общие"><i class="fa fa-cog"></i> Общие</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=group'"><span data-toggle="tooltip" data-placement="top" title="Группы"><i class="fa fa-clone"></i> Группы</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active3}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=ads'"><span data-toggle="tooltip" data-placement="top" title="Объявления"><i class="fa fa-plus"></i> Объявления</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active4}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=rules'"><span data-toggle="tooltip" data-placement="top" title="Правила"><i class="fa fa-plus"></i> Правила</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active5}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=list_forum'"><span data-toggle="tooltip" data-placement="top" title="Список форумов"><i class="fa fa-plus"></i> Список форумов</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active6}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=list_news'"><span data-toggle="tooltip" data-placement="top" title="Список новостей"><i class="fa fa-plus"></i> Список новостей</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active7}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=list_complaints'"><span data-toggle="tooltip" data-placement="top" title="Список жалоб"><i class="fa fa-plus"></i> Список жалоб</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active8}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=ban'"><span data-toggle="tooltip" data-placement="top" title="Забаненые"><i class="fa fa-plus"></i> Забаненые</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active9}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=url'"><span data-toggle="tooltip" data-placement="top" title="ЧПУ"><i class="fa fa-plus"></i> ЧПУ</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active10}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=title'"><span data-toggle="tooltip" data-placement="top" title="Управление заголовками"><i class="fa fa-plus"></i> Управление заголовками</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{active11}}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=forum&action=about'"><span data-toggle="tooltip" data-placement="top" title="О плагине"><i class="fa fa-plus"></i> О плагине</span></a></li>
</ul>
</div>
	<br/>
	{% if (info) %}
		<table border="0" cellspacing="0" cellpadding="0" width="100%" class="contentNav">
			<tr align="center">
				<td>
					<font color="red">
						{{ info }}
					</font>
				</td>
			</tr>
		</table><br/>
	{% endif %}
<div class="panel panel-default">
  <div class="panel-heading">
     {{panel}}
  </div>
<div class="panel-body">
	{{ entries }}
</div>

</div>