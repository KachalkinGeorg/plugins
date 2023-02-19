	<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr align="center">
			<td width="100%" class="contentNav" align="center" style="background-repeat: no-repeat; background-position: left;">
				<a href="?mod=extra-config&plugin=guestbook" class="btn btn-dark">{{ lang['gbconfig']['menu_settings'] }}</a>
				<a href="?mod=extra-config&plugin=guestbook&action=show_messages" class="btn btn-dark">{{ lang['gbconfig']['menu_messages'] }}</a>
				<a href="?mod=extra-config&plugin=guestbook&action=manage_fields" class="btn btn-dark">{{ lang['gbconfig']['menu_fields'] }}</a>
				<a href="?mod=extra-config&plugin=guestbook&action=social" class="btn btn-dark">{{ lang['gbconfig']['menu_social'] }}</a>
			</td>
		</tr>
	</table>
<br>
<div class="panel panel-default">
  <div class="panel-heading">
     {{panel}}
  </div>
<div class="panel-body">
	{{ entries }}
</div>

</div>