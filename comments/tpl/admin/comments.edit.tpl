<form name="form" method="post">
    <input type="hidden" name="comid" value="{{ comid }}" />
    <input type="hidden" name="postid" value="{{ postid }}" />
    <input type="hidden" name="subaction" value="doeditcomment" />
    
    <div class="row">
        <div class="col-sm-8">
            <!-- MAIN CONTENT -->
            <div class="panel panel-default mb-4">
                <div class="panel-heading">
                    <i class="fa fa-th-list"></i> {{ lang['comments:maincontent'] }}
                </div>
                <div id="maincontent" class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">{{ lang['comments:comment_link'] }}</label>
                        <div class="col-sm-9">
                            <div class="input-group">
                                <input type="text" value="{{ link }}" tabindex="3" class="form-control" readonly="" />
                                <span class="input-group-btn">
                                    <a href="{{ link }}" target="_blank" class="btn btn-default"><i class="fa fa-external-link"></i></a>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">{{ lang['comments:name'] }}</label>
                        <div class="col-sm-9">
                            <input type="text" name="author" value="{{ author }}" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">{{ lang['comments:email'] }}</label>
                        <div class="col-sm-9">
                            <input type="text" name="mail" value="{{ mail }}" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group" id="fullwidth">
                        <div class="col-sm-12">
                            {{ quicktags }}
                            <!-- SMILES -->
					<div id="modal-smiles" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="smiles-modal-label" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 id="smiles-modal-label" class="modal-title">{{ lang['comments:ins.smilies'] }}</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="modal-body">
									{{ smilies }}
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-dark" data-dismiss="modal">{{ lang['comments:cansel'] }}</button>
								</div>
							</div>
						</div>
					</div>
					
                            <textarea name="content" id="content" rows="8" class="form-control">{{ text }}</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-9">
                            <label for="send">
                                <input type="checkbox" id="send" name="send_notice" value="1" />&nbsp;{{ lang['comments:send_notice'] }}
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-9">
                            <label for="approve">
                                <input type="checkbox" id="approve" name="approve" value="1" {% if (1 == approve) %}checked{% endif %} />&nbsp;{{ moder1 }}
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="well panel-fixed-bottom">
                <div class="row">
                    <div class="col-sm-3"></div>
                <div class="col-sm-9">
                    <button type="button" title="{{ lang['delete'] }}" onClick="confirmIt('admin.php?mod=extra-config&plugin=comments&action=dell&comid={{ comid }}', '{{ lang['sure_del'] }}')" class="btn btn-danger pull-right"><i class="fa fa-trash-o"></i></button>
                        <button type="submit" title="{{ lang['save'] }} (Ctrl+S)" tabindex="5" class="btn btn-success">
                            <span class="visible-sm-block visible-xs-block"><i class="fa fa-floppy-o"></i></span>
                            <span class="hidden-sm hidden-xs">{{ lang.commit_change }}</span>
                        </button>
                </div>
                </div>
            </div>
        </div>
        
        <!-- Right edit column -->
        <div id="rightBar" class="col col-lg-4">
            <div class="card mb-4">
                <div class="card-header">
                    {{ lang['comments:additional'] }}
                </div>
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td>{{ lang['comments:date'] }}</td>
                            <td><span title="{{ comdate }}"> {{ comdateStamp|cdate }}</span></td>
                        </tr>
                        <tr>
                            <td>{{ lang['comments:ip'] }}</td>
                            <td>
                                <b>{{ ip }}</b>
                                <div class="pull-right">
                                    <a href="http://www.nic.ru/whois/?ip={{ ip }}" target="_blank" class="btn-sm btn-default"><i class="fa fa-eye"></i></a>&nbsp;
                                    <a href="admin.php?mod=ipban&iplock={{ ip }}" target="_blank" class="btn-sm btn-default"><i class="fa fa-ban"></i></a>&nbsp;
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
	var currentInputAreaID = 'content';
</script>