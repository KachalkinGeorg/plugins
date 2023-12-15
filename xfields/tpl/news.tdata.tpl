{% if (flags.tdata) %}
<table class="table table-condensed" id="tdataTable">
    <thead>
        <tr>
            <th>#</th>
            {% for entry in xtableHdr %}
            <th>{{ entry.title }}</th>
            {% endfor %}
            <th class="text-right">{{ lang['action'] }}</th>
        </tr>
    </thead>
    <tbody></tbody>
    <tfoot>
        <tr>
            <td colspan="{{ (xtablecnt+1) }}"></td>
            <td class="text-center" width="10">
                <button type="button" title="Добавить строки" onclick="tblLoadData(0);" class="btn btn-primary"><i class="fa fa-plus"></i></button>
            </td>
        </tr>
    </tfoot>
</table>
{% endif %}