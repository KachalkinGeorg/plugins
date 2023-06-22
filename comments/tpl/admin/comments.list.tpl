<div class="panel panel-default panel-table">
    <div class="panel-heading">
        <!-- Filter form: BEGIN -->
        <div class="form-group row">
            <!--Block 1-->
            <div class="col col-md-3 col-sm-6">
                <label>Статус</label>
               {{ approve }}
            </div>
            <!--/Block 1-->
            <!--Block 2-->
            <div class="col col-md-3 col-sm-6">
                <label>Модуль</label>
                {{ modules }}
            </div>
            <!--/Block 2-->
            <!--Block 3-->
            <div class="col col-md-3 col-sm-6">
                <label>Автор</label>
                <input type="text" name="author" id="author" value="{{ author }}" class="form-control">
            </div>
            <!--/Block 3-->
            <!--Block 4-->
            <div class="col col-md-3 col-sm-6">
                <label for="rpp">Записей</label>
                <div class="input-group">
                    <input type="text" name="rpp" id="rpp" value="{{ rpp }}" class="form-control">
                    <span class="input-group-btn">
                        <button type="submit" name="filter" value="true" class="btn btn-primary form-control">Показать</button>
                    </span>
                </div>
            </div>
            <!--/Block 4-->
        </div>
    </div>
    <!-- Filter form: END -->
    <!-- List of comments: BEGIN -->
    <div class="panel-body table-responsive">
        <table class="table table-condensed">
            <thead>
                <tr>
                    <th><input type="checkbox" class="select-all" title="{{ lang['select_all'] }}" /></th>
                    <th>#</th>
                    <th></th>
                    <th>Комментарий</th>
                    <th>Модуль</th>
                    <th>Автор</th>
                    <th>Дата</th>
                </tr>
            </thead>
            <tbody>
            {% for item in items %}
                <tr>
                    <td><input name="selected_comments[]" value="{{ item.id }}" type="checkbox" /></td>
                    <td>{{ item.id }}</td>
                    <td>{% if item.isApprove %}<i class="fa fa-check text-success"></i>{% else %}<i class="fa fa-times text-danger"></i>{% endif %}</td>
                    <td style="white-space: nowrap;"><a href="admin.php?mod=extra-config&plugin=comments&action=edit&comid={{ item.id }}">{{ item.text }}</a></td>
                    <td>{{ item.module }}</td>
                    <td>{% if item.authorLink %}<a href="{{ item.authorLink }}" target="_blank">{{ item.author }}</a>{% else %}{{ item.author }}{% endif %}</td>
                    <td><span title="{{ item.postdate }}">{{ item.postdateStamp|cdate }}</span></td>
                </tr>
            {% else %}
                <tr><td colspan="8">{{ lang['not_found'] }}</td></tr>
            {% endfor %}
            </tbody>
        </table>
    </div>
    <div class="panel-footer">
        <div class="row">
            <div class="col col-md-4">
                <!--{ % if flags.allow_modify % }-->
                <div class="input-group">
                    <select name="subaction" class="form-control">
                        <option value="">-- {{ lang['action'] }} --</option>
                        <option value="" class="divider" disabled>===================</option>
                        <option value="mass_approve">Опубликовать</option>
                        <option value="mass_forbidden">Снять с публикации</option>
                        <option value="" class="divider" disabled>===================</option>
                        <option value="mass_delete">{{ lang['delete'] }}</option>
                    </select>
                    <span class="input-group-btn">
                        <button type="submit" name="mass_action" value="true" class="btn btn-default">{{ lang['ok'] }}</button>
                    </span>
                </div>
                <!--{ % endif % }-->
            </div>
            <div class="col col-md-8 text-right">
                {{ pagesss }}
            </div>
        </div>
    </div>
</div>
