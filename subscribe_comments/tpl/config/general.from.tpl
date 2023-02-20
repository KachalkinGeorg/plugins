<form method="post" action="">
	<div class="panel-body" style="font-family: Franklin Gothic Medium;text-transform: uppercase;color: #9f9f9f;">Настройки</div>
		<div class="table-responsive">
			<table class="table table-striped">
					<tr>
						<td width="50%" valign=top>Включить отложенную рассылку?</td>
						<td width="50%" valign=top><select name="delayed_send">{delayed_send}</select></td>
					</tr>
			</table>
		</div>

		<div class="panel-body" style="font-family: Franklin Gothic Medium;text-transform: uppercase;color: #9f9f9f;">Настройки админки</div>
		<div class="table-responsive">
			<table class="table table-striped">
					<tr>
						<td width="50%" valign=top>Количество объектов на странице</td>
						<td width="50%" valign=top>
							<input name="admin_count" type="text" title="Количество объектов на странице" size="4" value="{admin_count}" class="form-control"/>
						</td>
					</tr>
				</table>
			</div>

		<div class="panel-footer" align="center" style="margin-left: -20px;margin-right: -20px;margin-bottom: -20px;">
			<button type="submit" class="btn btn-outline-primary">Сохранить</button>
		</div>

</form>