<form method="post" action="">

	<div class="panel-body" style="font-family: Franklin Gothic Medium;text-transform: uppercase;color: #9f9f9f;">Общие настройки</div>
	<div class="table-responsive">
		<table class="table table-striped">
			<tr>
				<td class="contentEntry1" valign=top>Кол-во пользователей для отображения на одной странице<br/></td>
				<td class="contentEntry2" valign=top>
					<input name="user_per_page" type="text" title="Кол-во пользователей для отображения на одной странице" size="5" value="{user_per_page}"/>
				</td>
			</tr>
			<tr>
				<td class="contentEntry1" valign=top>Title для страницы плагина</td>
				<td class="contentEntry2" valign=top>
					<input name="title_plg" type="text" title="Описание" size="50" value="{title_plg}"/>
				</td>
			</tr>
			<tr>
				<td class="contentEntry1" valign=top>Описание для страницы плагина</td>
				<td class="contentEntry2" valign=top>
					<input name="description" type="text" title="Описание" size="50" value="{description}"/>
				</td>
			</tr>
			<tr>
				<td class="contentEntry1" valign=top>Ключевые слова для страницы плагина<br/>
							<small></small>
						</td>
						<td class="contentEntry2" valign=top>
							<input name="keywords" type="text" title="Ключевые слова" size="50" value="{keywords}"/>
						</td>
					</tr>
				</table>
			</div>
			
	<div class="panel-body" style="font-family: Franklin Gothic Medium;text-transform: uppercase;color: #9f9f9f;">Настройки отображения</div>
	<div class="table-responsive">
		<table class="table table-striped">
			<tr>
				<td class="contentEntry1" valign=top>Выберите каталог из которого плагин будет брать шаблоны для отображения<br/>
							<small><b>Шаблон сайта</b> - плагин будет пытаться взять шаблоны из общего шаблона сайта; в
								случае недоступности - шаблоны будут взяты из собственного каталога плагина<br/><b>Плагин</b>
								- шаблоны будут браться из собственного каталога плагина
							</small>
							<br/></td>
				<td class="contentEntry2" valign=top><select name="localsource">{localsource}</select></td>
			</tr>

		</table>
	</div>

	<div class="panel-footer" align="center" style="margin-left: -20px;margin-right: -20px;margin-bottom: -20px;">
		<button type="submit" class="btn btn-outline-primary">Сохранить</button>
	</div>
			
</form>