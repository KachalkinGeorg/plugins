		<div id="comments" style="padding-top: 10px;">
			[comheader]<div class="title">Комментарии ({comnum})</div>[/comheader]
			<div class="content">
				<!-- Here is user's comments -->
				<div id="new_comments_rev"></div>
				{entries}
				<!-- Here is `add comments` form -->
				[regonly]
					<div class="ng-message">
						Уважаемый посетитель, Вы зашли на сайт как незарегистрированный пользователь.<br/>
						Мы рекомендуем Вам <a href="/register/">зарегистрироваться</a> либо <a href="/login/">войти</a> на сайт под своим именем.
					</div>
				[/regonly]
				[commforbidden]
					<div class="ng-message">Комментирование данной новости запрещено.</div>
				[/commforbidden]
				[more_comments]
					<div class="paginator nonebr" style="margin-top: 25px; margin-bottom: 25px;">
						<ul>
							<li>{more_comments}</li>
						</ul>
					</div>
				[/more_comments]
				{form}
			</div>
		</div>