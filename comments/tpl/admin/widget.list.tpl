<table class="table table-condensed">
    <thead>
        <tr>
            <th>#</th>
            <th>{{ lang['gallery:label_widget_name'] }}</th>
            <th>{{ lang['gallery:label_widget_title'] }}</th>
            <th>{{ lang['gallery:label_galery'] }}</th>
            <th>{{ lang['gallery:label_skin'] }}</th>
            <th>{{ lang['gallery:label_rand'] }}</th>
            <th>{{ lang['state'] }}</th>
            <th class="text-right">{{ lang['gallery:label_action'] }}</th>
        </tr>
    </thead>
    <tbody>
    {% for item in items %}
        <tr>
            <td>{{ item.id }}</td>
            <td>{{ item.name }}</td>
            <td>{{ item.title }}</td>
            <td>{{ item.galery }}</td>
            <td>{{ item.skin }}</td>
            <td>{{ item.rand }}</td>
            <td>{% if item.isActive %}<i class="fa fa-check text-success"></i>{% else %}<i class="fa fa-times text-danger"></i>{% endif %}</td>
            <td class="text-right">
                <div class="btn-group">
                    <a href="admin.php?mod=extra-config&plugin=gallery&action=widget_add&id={{ item.id }}" class="btn btn-default"><i class="fa fa-pencil"></i></a>
                    <a href="#" onclick="confirmIt('admin.php?mod=extra-config&plugin=gallery&action=widget_dell&id={{ item.id }}','{{ lang['sure_del'] }}');return false;" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
                </div>
            </td>
        </tr>
    {% else %}
        <tr><td colspan="9">{{ lang['not_found'] }}</td></tr>
    {% endfor %}
    </tbody>
</table>