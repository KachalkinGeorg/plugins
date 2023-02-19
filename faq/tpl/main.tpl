<div class="navbar-default navbar-component">
<ul class="nav nav-tabs nav-fill mb-3 d-md-flex d-block">
	<li class="nav-item"><a href="#" class="nav-link {{ active1 }}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=faq'"><span data-toggle="tooltip" data-placement="top" title="Список вопросов"><i class="fa fa-list-ul"></i> Список вопросов</span></a></li>
	<li class="nav-item"><a href="#" class="nav-link {{ active2 }}" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=faq&action=add_faq'"><span data-toggle="tooltip" data-placement="top" title="Добавить вопрос"><i class="fa fa-plus-circle"></i> Добавить вопрос</span></a></li>
</ul>
</div>
	
<div class="panel panel-default">
  <div class="panel-heading">
    {{ panel }}
  </div>
<div class="panel-body">

	{{ entries }}

</div>
</div>