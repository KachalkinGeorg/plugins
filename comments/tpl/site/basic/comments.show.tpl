<div id="comment_{id}" class="comment {alternating}" itemscope="" itemtype="http://schema.org/Comment">
	<div>
		<div>
			<div>
				<div class="avatar">
					{avatar}
				</div>
				<div class="head">
					<div class="num" style="float: right;">#{comnum}</div>
					{line} [profile]<a href="#{author_id}" title="{l_profile}"><span itemprop="author">{author}</span></a>{show_profile}[/profile]<br />
					<div><span itemprop="dateCreated">{date}</span>&nbsp;<small title="{date}">&nbsp;•&nbsp;{dateStamp}</small></div>
				</div>

				[if-have-perm]
				<ul class="actions">
					[quote]<li><a onmouseover="copy_quote('{author}');" onclick="quote();return false;" style="cursor: pointer;" class="quotes">{l_quote}</a></li>[/quote]
					[quote]<li><a rel="nofollow" onmouseover="copy_quote('{author}');" onclick="quote();return false;" style="cursor: pointer;">Ответить</a></li>[/quote]
					<li>[edit-com]Изменить[/edit-com]</li>
					<li>[del-com]Удалить[/del-com]

					<div id="delcom{id}" class="popup">
						<div class="popup-wrapper">
							<div class="popup-inner">
								<div class="popup-header">
								<div class="popup-title">Удалить комментарий <b>#{comnum}</b>?</div>
									<a href="#close" title="Закрыть" class="popup-close"></a>
								</div>
								<div class="popup-text">
								<br>
									Вы действительно хотите удалить комментарий от <b>{author}</b>?
								<br>
								</div>
								<div class="popup-footer">
									<div style="text-align: right;padding: 8px;">{delcom}</div>
								</div>
								
							</div>
						</div>	
					</div>

					</li>
				</ul>
				[/if-have-perm]

				<span itemprop="text">{comment-short}</span>
				[comment_full]
					<span id="comment_full{comnum}" itemprop="text" style="display: none;">{comment-full}</span>
					<p style="text-align: right;"><a href="javascript:ShowOrHide('comment_full{comnum}');">{l_showhide}</a></p>
				[/comment_full]
			
				[answer]
					<br clear="all" /><div class="signature">---------------------------</div><div class="slink">{answer}</div>
					<div><i>{l_answer}</i> <b>{name}</b></div>
				[/answer]
			
				<div class="clr"></div>
			</div>
		</div>
	</div>
</div>