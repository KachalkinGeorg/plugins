<script type="text/javascript">
function update_comment(postid, action) {
    var form = document.getElementById('comment');
    var params = {
        {% if not(global.flags.isLogged) %}
            "name": form.name.value,
            "mail": form.mail.value,
            {% if (useCaptcha) %}"captcha": form.captcha.value,{% endif %}
        {% endif %}
        "content": form.content.value,
        "tokken": form.tokken.value,
        "module": form.module.value,
        "redirect": form.redirect.value,
        "postid": postid,
        "action": action,
        "ajax": "1",
        "json": "1",
        };
    $.reqJSON('{{ admin_url }}/rpc.php', 'plugin.comments.update', params, function(json) {
        form.content.value = '';
        $('#new_comments').html(json.content);
        $('html, body').animate({ scrollTop: $('#new_comments').offset().top-87 }, 888);
        $.notify({message: json.message},{type: 'success'});
        {% if (useCaptcha and not(global.flags.isLogged)) %}reload_captcha();{% endif %}
    });
}
</script>

<div class="respond card card-body">

    <form id="comment" method="post" action="" name="form" onsubmit="update_comment('{{ postid }}', 'add'); return false;" novalidate>
        <input type="hidden" name="tokken" value="{{ tokken }}" />
        <input type="hidden" name="module" value="{{ module }}" />
        <input type="hidden" name="redirect" value="{{ redirect }}" />

        <fieldset>
            <legend class="">Добавить комментарий</legend>
            {% if not(global.flags.isLogged) %}
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="text" name="name" value="{{ savedname }}" class="form-control" placeholder="Имя" id="name" required="" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="email" name="mail" value="{{ savedmail }}" class="form-control" placeholder="Email" id="email" required="" />
                        </div>
                    </div>
                    {% if (useCaptcha) %}
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="text" name="captcha" class="form-control" placeholder="Код безопасности" id="captcha" required="" />
                            <span class="input-group-addon p-0">
                                <img id="img_captcha" src="{{ captcha_url }}?rand={{ captcha_rand }}" alt="captcha" class="captcha" />
                            </span>
                        </div>
                    </div>
                    {% endif %}
                </div>
            {% endif %}
            <div class="form-group">
                {{ bbcodes }}
                {% if (useSmilies) %}
                <div id="modal-smiles" class="modal fade" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Вставить смайл</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            </div>
                            <div class="modal-body text-center">
                                {{ smilies }}
                            </div>
                            <div class="modal-footer">
                                <button type="cancel" class="btn btn-default" data-dismiss="modal">{{ lang['cancel'] }}</button>
                            </div>
                        </div>
                    </div>
                </div>
                {% endif %}
                <textarea onkeypress="if(event.keyCode==10 || (event.ctrlKey && event.keyCode==13)) {update_comment('{{ postid }}','add');}" name="content" id="content" rows="8" class="form-control message-content" placeholder="Комментарий" required=""></textarea>
            </div>
            <div class="form-group">
                <p>Ваш e-mail не будет опубликован. Убедительная просьба соблюдать правила этики. Администрация оставляет за собой право удалять сообщения без объяснения причин.</p>
            </div>
        </fieldset>

        <div class="form-group">
            <button type="submit" id="sendComment" class="btn btn-primary">Написать</button>
        </div>
    </form>
</div>