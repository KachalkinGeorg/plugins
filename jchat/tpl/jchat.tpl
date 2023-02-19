<script type="text/javascript">
[:include jchat.script.header.js]
</script>
<table border="0" width="230" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table border="0" width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<td style="background-image:url('{tpl_url}/images/2z_36.gif');" width="100%">
						&nbsp;<b><font color="#FFFFFF">Открыть в окне</font></b>[selfwin]
						<a target="_blank" href="{link_selfwin}"><img src="{skins_url}/images/open_new.png" width="15" height="11" border="0" alt="New window"/></a>[/selfwin]
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table border="0" width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<td bgcolor="#FFFFFF">
						<div class="block_cal" align="left">

							<!-- THIS IS REQUIRED BLOCK. PLEASE SAVE IT -->
							<div style="overflow: auto; height: 300px;" onclick="jchatProcessAreaClick(event);">
								<table id="jChatTable" cellspacing="0" cellpadding="0" width="100%">
									<tr>
										<td>Loading chat...</td>
									</tr>
								</table>
							</div>
							[post-enabled]
							<form method="post" name="jChatForm" id="jChatForm" onsubmit="chatSubmitForm(); return false;">
								<table width="100%">[not-logged]
									<tr>
										<td colspan="2" align="left">
											<input type="text" name="name" value="{l_jchat:input.username}" onfocus="if(!jChatInputUsernameDefault){this.value='';jChatInputUsernameDefault=1;}"/>
										</td>
									</tr>
									[/not-logged]
									<tr>
										<td align="left">
											<textarea id="jChatText" name="text" style="width: 100%; height: 40px;" onfocus="jchatCalculateMaxLen(this,'jchatWLen', {maxlen});" onkeyup="jchatCalculateMaxLen(this,'jchatWLen', {maxlen});"></textarea>
										</td>
										<td valign="top"><span id="jchatWLen">{maxlen}</span></td>
									</tr>
									<tr>
										<td colspan="2" align="left">
											<input id="jChatSubmit" type="submit" value="{l_jchat:button.post}"/></td>
									</tr>
								</table>
							</form>
							[/post-enabled]
							<!-- END OF REQUIRED BLOCK -->

						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<!-- SCRIPTS INTERNALS BEGIN ((( DO NOT CHANGE ))) -->
<script type="text/javascript">
[:include jchat.script.footer.js]
</script>
<!-- SCRIPTS INTERNALS END -->
