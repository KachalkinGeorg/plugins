
<form method="post" action="?mod=extra-config&plugin=ads_pro">
	<input type="hidden" name="action" value="main_submit" />
	<fieldset>
		<table class="table table-sm">
			<tr>
				<td width="50%" class="contentEntry1" align="left">{l_ads_pro:general_news}</td>
				<td class="contentEntry1" align="left"><select name="support_news">
						<option value="0" {s_news0}>{l_noa}
						<option value="1" {s_news1}>{l_yesa}
					</select></td>
				</td>
			</tr>
			<tr>
				<td width="50%" class="contentEntry1" align="left">{l_ads_pro:news_cfg_sort}</td>
				<td class="contentEntry1" align="left"><select name="news_cfg_sort">
						<option value="0" {s_news_sort0}>{l_ads_pro:news_cfg_sort_id}
						<option value="1" {s_news_sort1}>{l_ads_pro:news_cfg_sort_title}
					</select></td>
				</td>
			</tr>
			<tr>
				<td width="50%" class="contentEntry1" align="left">{l_ads_pro:multidisplay_mode}</td>
				<td class="contentEntry1" align="left"><select name="multidisplay_mode">
						<option value="0" {multidisplay_mode_0}>{l_ads_pro:multidisplay_mode0}
						<option value="1" {multidisplay_mode_1}>{l_ads_pro:multidisplay_mode1}
						<option value="2" {multidisplay_mode_2}>{l_ads_pro:multidisplay_mode2}
					</select></td>
				</td>
			</tr>
		</table>
	</fieldset>
	<div class="panel-footer" align="center" style="margin-left: -20px;margin-right: -20px;margin-bottom: -20px;">
		<input type="submit" value="{l_ads_pro:general_submit}" class="btn btn-outline-success" />
		<input type="button" onmousedown="javascript:window.location.href='?mod=extra-config&plugin=ads_pro&action=clear_cash'" value="{l_ads_pro:button_clear_cash}" class="btn btn-outline-warning" />
	</div>
</form>
