<li class="comment clearfix {{ alternating }}" itemscope="" itemtype="http://schema.org/Comment">
    <a id="comment_{{ id }}"></a>
    <div class="comment-content post-content" itemprop="text">
        <img src="{{ avatar }}" alt="" class="rounded-circle pull-left" width="80" />
        <div class="comment-meta">
            {% if (useBB) %}
                <a href="#" rel="nofollow" onmouseover="copy_quote('{{ author }}');" onclick="quote();return false;" class="comment-reply-link"><span>{{ lang['comments:quote'] }}</span></a>
            {% endif %}
            {% if (havePerm) %}
                <a href="{{ edit_link }}" class="comment-reply-link"><span>{{ lang['comments:edit'] }}</span></a>
                <a href="#" onclick="confirmIt('{{ delete_link }}', '{{ lang['sure_del'] }}');return false;" class="comment-reply-link"><span>{{ lang['comments:comdelete'] }}</span></a>
            {% endif %}
            <div class="comment-author">
                {% if (isProfile) %}
                <a href="{{ profile_link }}" title="{{ lang['comments:profile'] }}" class="comment-author-link"><span itemprop="author">{{ author }}</span></a>
                {% else %}
                    <span itemprop="author">{{ author }}</span>
                {% endif %}
            </div>
            <small title="{{ date }}">&nbsp;•&nbsp;{{ dateStamp | cdate  }}</small>
            <p>{{ comment }}</p>
            {% if (hasAnswer) %}<p class="well well-sm text-muted">{{ lang['comments:answer'] }} <b>{{ name }}</b>:<br />{{ answer }}</p>{% endif %}
        </div>
    </div>
</li>