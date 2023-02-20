<form action="?mod=extra-config&amp;plugin=re_stat" method="post" name="options_bar">
    <input type="hidden" name="action" value="" />
    <input type="hidden" name="id" value="-1" />
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-12 text-center">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <input type="submit" value="Список" class="btn btn-outline-primary" onClick="document.forms['options_bar'].action.value = '';" />
                    <input type="submit" value="Добавить" class="btn btn-outline-primary" onClick="document.forms['options_bar'].action.value = 'add';" />
                </div>
            </div>
        </div>
	</div>
</form>

<div class="panel panel-default">
  <div class="panel-heading">
     {panel}
  </div>
	<div class="panel-body">
      <table class="table table-sm table-bordered table-hover ">
                <thead>
                    <tr>
                        <td>№п.п.</td>
                        <td>Код</td>
                        <td>Статическая страница</td>
                        <td width="160">Действие</td>
                    </tr>
                </thead>
                {entries}
            </table>
        </div>
        <form action="?mod=extra-config&amp;plugin=re_stat" method="post" name="options_bar_bottom">
            <input type="hidden" name="action" value="re_map" />
            <div class="card-footer text-center"><input type="submit" value="Перестроить карту ссылок" class="btn btn-outline-success" /></div>
        </form>
</div>