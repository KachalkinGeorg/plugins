<div class="navbar-default navbar-component">
<ul class="nav nav-tabs nav-fill mb-3 d-md-flex d-block" role="tablist">
	<li class="nav-item">
		<a href="?mod=extra-config&plugin=xfields&section=news" class="nav-link {{ 'news' == sectionID ? 'active' : '' }}"><i class="fa fa-newspaper-o"></i>&nbsp;Новости: поля</a>
	</li>
	<li class="nav-item">
		<a href="?mod=extra-config&plugin=xfields&section=grp.news" class="nav-link {{ 'grp.news' == sectionID ? 'active' : '' }}"><i class="fa fa-object-group"></i>&nbsp;Новости: группы</a>
		</li>
	<li class="nav-item">
		<a href="?mod=extra-config&plugin=xfields&section=tdata" class="nav-link {{ 'tdata' == sectionID ? 'active' : '' }}"><i class="fa fa-th"></i>&nbsp;Новости: таблицы</a>
	</li>
	{% if (pluginIsActive('uprofile')) %}
	<li class="nav-item">
		<a href="?mod=extra-config&plugin=xfields&section=users" class="nav-link {{ 'users' == sectionID ? 'active' : '' }}"><i class="fa fa-address-card-o"></i>&nbsp;Пользователи: поля</a>
	</li>
	{% endif %}
	<li class="nav-item">
		<a href="?mod=extra-config&plugin=xfields&action=about" class="nav-link {{ sectionID }}"><i class="fa fa-exclamation-circle"></i>&nbsp;О плагине</a>
	</li>	
</ul>
</div>
{{ entries }}