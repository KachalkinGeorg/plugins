<link rel="stylesheet" href="{{ admin_url }}/plugins/forum/tpl/config/wbbtheme.css" type="text/css"/>
<script src="{{ admin_url }}/plugins/forum/tpl/config/jquery.wysibb.min.js"></script>
<form method="post" action="" name="form">

	<fieldset class="admGroup">
		<legend class="title"><b>Объявления</b></legend>
		<table class="table table-sm mb-2">
			<tr>
				<td class="contentEntry1">Объявление на главной<br/>
					<small>Допускается всё без ограничения</small>
				</td>
				<td class="contentEntry2">
					<textarea type="text" name="announcement" id="content" cols="60" rows="8">{{ announcement }}</textarea>
				</td>
			</tr>
			<tr>
				<td class="contentEntry1" valign=top>Включить объявление?<br/>
					<small></small>
				</td>
				<td class="contentEntry2" valign=top>{{ announcement_on_off }}</td>
			</tr>
		</table>
	</fieldset>

	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td width="100%" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td width="100%" colspan="2" class="contentEdit" align="center">
				<button type="submit" name="submit" class="btn btn-outline-success"/>Сохранить</button>
			</td>
		</tr>
	</table>
</form>
<script>
	var myOpt = {
		buttons: 'bold,italic,underline,strike|,-|,link,myimg,|,smilebox,|,bullist,numlist,quotes, |,codephp, ,|,quote_name',
		allButtons: {
			myimg: {
				title: 'Изображение',
				buttonHTML: '<span class="ve-tlb-img"></span>',
				modal: {
					title: 'Вставить изображение',
					width: '600px',
					tabs: [{
						input: [
							{
								param: "SRC",
								title: "Введите адрес изображения",
								validation: '^http(s)?://.*?\.(jpg|png|gif|jpeg)$'
							},
							{param: "TITLE", title: "Введите заголовок изображения"}
						]
					}],
					onLoad: function () {
					},
					onSubmit: function () {
					}
				}, transform: {
					'<img src="{SRC}" title="{TITLE}" />': '[img title={TITLE}]{SRC}[/img]'
				}
			},
			codephp: {
				title: CURLANG.code,
				buttonText: "[code]",
				transform: {
					'<div class="codewrap"><div class="codetop">Код: PHP</div><div class="codemain">{SELTEXT}</div></div>': "[code=PHP]{SELTEXT}[/code]"
				}
			}, quotes: {
				title: CURLANG.quote,
				buttonHTML: '<span class="ve-tlb-quote"></span>',
				transform: {
					'<div class="quote">{SELTEXT}</div>': '[quote]{SELTEXT}[/quote]',
					'<div class="quote"><cite>{AUTHOR} написал:</cite>{SELTEXT}</div>': '[quote={AUTHOR}]{SELTEXT}[/quote]'
				}
			}
		},
		smileList: [
			{title: CURLANG.sm1, img: '<img src="{themePrefix}{themeName}/smiles/1.gif" class="sm">', bbcode: ":)"},
			{title: CURLANG.sm8, img: '<img src="{themePrefix}{themeName}/smiles/2.gif" class="sm">', bbcode: ":("},
			{title: CURLANG.sm1, img: '<img src="{themePrefix}{themeName}/smiles/3.gif" class="sm">', bbcode: ":D"},
			{title: CURLANG.sm3, img: '<img src="{themePrefix}{themeName}/smiles/11.gif" class="sm">', bbcode: ";)"},
			{title: CURLANG.sm4, img: '<img src="{themePrefix}{themeName}/smiles/4.gif" class="sm">', bbcode: ":up:"},
			{title: CURLANG.sm5, img: '<img src="{themePrefix}{themeName}/smiles/9.gif" class="sm">', bbcode: ":down:"},
			{
				title: CURLANG.sm6,
				img: '<img src="{themePrefix}{themeName}/smiles/6.gif" class="sm">',
				bbcode: ":shock:"
			},
			{
				title: CURLANG.sm7,
				img: '<img src="{themePrefix}{themeName}/smiles/9.gif" class="sm">',
				bbcode: ":angry:"
			},
			{title: CURLANG.sm9, img: '<img src="{themePrefix}{themeName}/smiles/14.gif" class="sm">', bbcode: ":sick:"}
		]
	};
	$('#content').wysibb(myOpt);
</script>
