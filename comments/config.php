<?php

if (!defined('NGCMS')) die ('HAL');

// Load lang files
pluginsLoadConfig();
loadPluginLang('comments', 'config', '', '', ':');

switch ($action) {
    case 'list':
        if (!empty($subaction)) {
            if (empty($_REQUEST['selected_comments']) or !count($_REQUEST['selected_comments'])) {
				msg(['type' => 'danger', 'text' => $lang['comments:msg.selectcom']]);
				return print_msg( 'warning', $lang['comments:comments'], $lang['comments:msg.selectcom'], '?mod=extra-config&plugin=comments&action=list' );
            } else {
                switch($subaction) {
                    case 'mass_approve':
                        pluginListUpdateAction($plugin, $action, $subaction);
						return;
                        break;
                    case 'mass_forbidden':
                        pluginListUpdateAction($plugin, $action, $subaction);
						return;
                        break;
                    case 'mass_delete':
                        pluginListDeleteAction($plugin, $action);
						return;
                        break;
                }
            }
        }
        pluginListAction($plugin, $action);
        break;

    case 'dell':
        pluginListDeleteAction($plugin, $action);
        break;

    case 'edit':
    case 'edit_submit':
        pluginListEditAction($plugin, $action);
        break;
	case 'about': 			about();					break;
    default: main($plugin, $action);
}

function about() {
global $config, $mysql, $twig, $parse, $breadcrumb, $lang;

	$breadcrumb = breadcrumb('<i class="fa fa-briefcase btn-position"></i><span class="text-semibold">'.$lang['comments:comments'].'</span>', array('?mod=extras' => '<i class="fa fa-puzzle-piece btn-position"></i>'.$lang['extras'].'', '<i class="fa fa-exclamation-circle btn-position"></i>О плагине' ) );
	
	$tpath = locatePluginTemplates(array('main', 'about'), 'comments', 1);

	$xt = $twig->loadTemplate($tpath['about'].'about.tpl');
	$tvars = array();
	$xg = $twig->loadTemplate($tpath['main'].'main.tpl');
	
	$count = $mysql->result('SELECT COUNT(id) FROM '.prefix.'_comments WHERE approve = '.db_squote(0));

	$tVars['count'] = !empty($count)?'[ '.$count.' ]':'';
	$tVars = array(
		'active3' => 'active',
		'entries' => $xt->render($tVars)
	);
	
	print $xg->render($tVars);
}

function pluginListAction($plugin, $action) {
    global $config, $mysql, $twig, $parse, $breadcrumb, $lang;

	$tpath = locatePluginTemplates(array('main', 'comments.list'), 'comments', 1);
	
	$breadcrumb = breadcrumb('<i class="fa fa-comments-o btn-position"></i><span class="text-semibold">'.$lang['comments:comments'].'</span>', array('?mod=extras' => '<i class="fa fa-puzzle-piece btn-position"></i>'.$lang['extras'].'', '?mod=extra-config&plugin=comments' => '<i class="fa fa-comments-o btn-position"></i>'.$lang['comments:comments'].'',  '<i class="fa fa-exclamation-circle btn-position"></i>Редактирование' ) );

	$xt = $twig->loadTemplate($tpath['comments.list'].'comments.list.tpl');
	$tVars = array();
	$xg = $twig->loadTemplate($tpath['main'].'main.tpl');

	$approve = intval(getIsSet($_REQUEST['approve']));
    $author = !empty($_REQUEST['author']) ? secure_html($_REQUEST['author']) : '';
    $page = !empty($_REQUEST['page']) ? intval($_REQUEST['page']) : 1;

    $admCookie = admcookie_get();

    $fRPP = (isset($_REQUEST['rpp']) && ($_REQUEST['rpp'] != '')) ? intval($_REQUEST['rpp']) : intval($admCookie['users:pp']);
    if (($fRPP < 2) || ($fRPP > 2000)) {
        $fRPP = 8;
    }

    $admCookie['comments:pp'] = $fRPP;
    admcookie_set($admCookie);

    $tVars['approve'] = MakeDropDown(array('0' => $lang['comments:all_comment'], '1' => $lang['comments:publ_moder'], '2' => $lang['comments:publ_done']), 'approve', $approve);
    $tVars['author'] = $author;

    $commentsFilter = [];
	
    if (isset($_REQUEST['approve']) && (intval($_REQUEST['approve']))) {
        $commentsFilter[] = 'approve = '.(intval($approve) - 1);
    }

    if (!empty($author)) {
		$commentsFilter[] = 'author=' . db_squote($author);
    }
    $sqlQPart = 'from `'.prefix.'_comments` ' . (count($commentsFilter) ? "where ".implode(" AND ", $commentsFilter) : '') . ' order by id desc';

    $cnt = $mysql->record("select count(`id`) as cid ".$sqlQPart);
    $countNews = $cnt['cid'];
    $countPages = ceil($countNews / $fRPP);

    if (($page > $countPages) and ($page > 1))
        $page = $countPages;

    $items = array();
    $rows = $mysql->select("select * ".$sqlQPart ." LIMIT ".(($page - 1) * $fRPP) . "," . $fRPP);
    foreach($rows as $row) {

        $text = $row['text'];
        if ($config['blocks_for_reg']) {$text = $parse->userblocks($text);}
        if ($config['use_bbcodes']) {$text = $parse->bbcodes($text);}
        if ($config['use_htmlformatter']) {$text = $parse->htmlformatter($text);}
        $text = $parse->truncateHTML($text, 100);
        if ($config['use_smilies']) {$text = $parse->smilies($text);}

        if ($row['author_id'] and getPluginStatusActive('uprofile')) {
            $authorLink = checkLinkAvailable('uprofile', 'show') ?
                generateLink('uprofile', 'show', array('name' => $row['author'], 'id' => $row['author_id'])) :
                generateLink('core', 'plugin', array('plugin' => 'uprofile', 'handler' => 'show'), array('id' => $row['author_id']));
        } else {
            $authorLink = false;
        }

		$newsRow = $mysql->record("SELECT * FROM `".prefix."_news` WHERE id=".db_squote($row['post']));

        $items[] = [
            'id' => intval($row['id']),
            'postID' => intval($row['post']),
            'text' => $text,
			'link' => newsGenerateLink($newsRow, false, 0, true),
			'title' => $newsRow['title'],
            'postdate' => LangDate('d.m.Y H:i:s', intval($row['postdate'])),
            'postdateStamp' => intval($row['postdate']),
            'isApprove' => intval($row['approve']),
            'parent' => intval($row['parent_id']),
            'author' => secure_html($row['author']),
            'authorID' => intval($row['author_id']),
            'authorLink' => $authorLink,
            'mail' => secure_html($row['mail']),
            'ip' => filter_var($row['ip'], FILTER_VALIDATE_IP) ? $row['ip'] : 'NaN',
        ];

    }

    $tVars['items'] = $items;
    $tVars['rpp'] = $fRPP;

    $pagination = generateAdminPagelist([
                'current' => $page,
                'count' => $countPages,
                'url' => admin_url.
                    '/admin.php?mod=extra-config&plugin=comments&action=list'.
                    '&approve='.$approve.
                    '&author='.$author.
                    ($fRPP?'&rpp='.$fRPP:'').
                    '&page=%page%'
    ]);
	
	if (count($items) > 0) {
		$tVars['pagesss'] = $pagination;
	}
	
	$tVars['moder1'] = pluginGetVariable('comments', 'moderate') ? $lang['comments:public'] : $lang['comments:publ_read'];
	$tVars['moder2'] = pluginGetVariable('comments', 'moderate') ? $lang['comments:public_off'] : $lang['comments:publ_unread'];

	$tVars = array(
		'active2' => 'active',
		'entries' => $xt->render($tVars)
	);
	
	print $xg->render($tVars);

}

// Редактирование комментарий
function pluginListEditAction($plugin, $action) {
    global $mysql, $twig, $config, $userROW, $PHP_SELF, $lang, $breadcrumb;

	$tpath = locatePluginTemplates(array('main', 'comments.edit'), 'comments', 1);
	
	$breadcrumb = breadcrumb('<i class="fa fa-comments-o btn-position"></i><span class="text-semibold">'.$lang['comments:comments'].'</span>', array('?mod=extras' => '<i class="fa fa-puzzle-piece btn-position"></i>'.$lang['extras'].'', '?mod=extra-config&plugin=comments' => '<i class="fa fa-comments-o btn-position"></i>'.$lang['comments:comments'].'',  '<i class="fa fa-exclamation-circle btn-position"></i>Редактирование' ) );

	$xt = $twig->loadTemplate($tpath['comments.edit'].'comments.edit.tpl');
	$tVars = array();
	$xg = $twig->loadTemplate($tpath['main'].'main.tpl');
	
    // comment ID не найден
    if (empty($_REQUEST['comid'])) {
		msg(['type' => 'error', 'text' => $lang['comments:comid_not_found']]);
        print_msg( 'error', $lang['comments:comments'], $lang['comments:comid_not_found'], '?mod=extra-config&plugin=comments&action=list' );
        return;
    }

    $comid = intval($_REQUEST['comid']);

    // Найти комментарий в базе данных
    if (!is_array($comment = $mysql->record("select * from `".prefix."_comments` where id = ".db_squote($comid)))) {
		msg(['type' => 'danger', 'text' => $lang['comments:msg.not_found']]);
		print_msg( 'warning', $lang['comments:comments'], $lang['comments:msg.not_found'], '?mod=extra-config&plugin=comments&action=list' );
        return;
    }

    // Проверка из БД
    $post = intval($comment['post']);
    $postdate = intval($comment['postdate']);
    $author = secure_html($comment['author']);
    $mail = secure_html($comment['mail']);
    $authorID = intval($comment['author_id']);
    $ip = filter_var($comment['ip'], FILTER_VALIDATE_IP) ? $comment['ip'] : 'NaN';
    $text = $comment['text'];
    $approve = intval($comment['approve']);
    $moderate = (1 == pluginGetVariable('comments', 'moderate')) ? true : false;

    // подготовка данных для установления ссылки на то место, где размещен этот комментарий
    $moduleRow = $mysql->record("SELECT * FROM `".prefix."_news` WHERE id=".db_squote($post));
    $link = newsGenerateLink($moduleRow, false, 0, true);

    if (isset($_POST['subaction']) and $_POST['subaction'] == 'doeditcomment') {
        if (!trim($_POST['author']) or !trim($_POST['mail'])) {
			msg(['type' => 'danger', 'text' => $lang['comments:msge_namefield']]);	
        } else {
            $text = str_replace("{","&#123;",str_replace("\r\n", "<br />", htmlspecialchars(trim($_POST['content']), ENT_COMPAT, 'UTF-8')));
            $approve = !isset($_POST['approve']) ? 0 : 1;
            if(0 != $authorID) {
                // comment is registered user
                $mysql->query("UPDATE `".prefix."_comments` SET text=".db_squote($text).", approve=".db_squote($approve)." WHERE id=".db_squote($comid));
                // Update counter for user, If change status approve for comment
                if ($approve != intval($comment['approve'])) {
                    if ($moderate and $approve) {
                        $mysql->query("update `".prefix."_users` set com=com+1 where id=".db_squote($authorID));
                    } elseif ($moderate and !$approve) {
                        $mysql->query("update `".prefix."_users` set com=com-1 where id=".db_squote($authorID));
                    }
                }
            } else {
                // comment is not registered user
                $author = secure_html($_POST['author']);
                $mail = secure_html($_POST['mail']);
                $mysql->query("UPDATE `".prefix."_comments` SET text=".db_squote($text).", approve=".db_squote($approve).", author=".db_squote($author).", mail=".db_squote($mail)." WHERE id=".db_squote($comid));
            }

            // Update comment counter in news, If change status approve for comment
            if ($approve != intval($comment['approve'])) {
                if ($moderate and $approve) {
                    $mysql->query("update `".prefix."_news` set com=com+1 where id=".db_squote($post));
                } elseif ($moderate and !$approve) {
                    $mysql->query("update `".prefix."_news` set com=com-1 where id=".db_squote($post));
                }
            }

            // inform_author
            if (isset($_POST['send_notice']) and '1' == $_POST['send_notice'] and $mail) {
                sendEmailMessage($mail, $lang['comments:comanswer'], sprintf($lang['comments:notice_edit'], $userROW['name'], $text, $link), 'html');
            }
			msg(['type' => 'info', 'text' => $lang['comments:msgo_saved']]);
			return print_msg( 'update', $lang['comments:comments'], $lang['comments:msgk_saved'], array('?mod=extra-config&plugin=comments&action=edit&comid='.$comid => $lang['comments:edit_com'], '?mod=extra-config&plugin=comments&action=list' => $lang['comments:back_list'] ) );
        }
    }

    $tVars = array(
        'php_self' 		=> $PHP_SELF,
        'quicktags' 	=> QuickTags('currentInputAreaID', 'editcom'),
        'smilies' 		=> $config['use_smilies'] ? InsertSmilies('comments', 10) : '',
        'ip' 			=> $ip,
        'author' 		=> $author,
        'mail' 			=> $mail,
        'text' 			=> str_replace("<br />", "\r\n", $text),
        'postid' 		=> $post,
        'comid' 		=> $comid,
        'comdate' 		=> LangDate((pluginGetVariable('comments', 'timestamp') ? pluginGetVariable('comments', 'timestamp') : 'j.m.Y - H:i'), $postdate),
        'comdateStamp' 	=> $postdate,
        'approve' 		=> $approve,
		'moder1' 		=> pluginGetVariable('comments', 'moderate') ? $lang['comments:public'] : $lang['comments:publ_read'],
        'link' 			=> $link,
    );

	$tVars = array(
		'entries' => $xt->render($tVars)
	);
	
	print $xg->render($tVars);

}

// Удаление комментария
function pluginListDeleteAction($plugin, $action) {
    global $mysql, $config, $lang;

    // comment ID не установлен
    if (empty($_REQUEST['comid']) and empty($_REQUEST['selected_comments']) and !count($_REQUEST['selected_comments'])) {
        msg(['type' => 'danger', 'text' => $lang['comments:comid_not_found']]);
        return print_msg( 'error', $lang['comments:comments'], $lang['comments:comid_not_found'], '?mod=extra-config&plugin=comments&action=list' );;
    }

    $commentsArray = !empty($_REQUEST['comid']) ? ['0' => $_REQUEST['comid']] : $_REQUEST['selected_comments'];
    $moderate = (1 == pluginGetVariable('comments', 'moderate')) ? true : false;

    foreach ($commentsArray as $comid) {

        $comid = intval($comid);

        // Найти комментарий в базе данных
        if (!is_array($comment = $mysql->record("select * from `".prefix."_comments` where id = ".db_squote($comid)))) {
            msg(['type' => 'danger', 'text' => $lang['comments:msg.not_found']]);
            return print_msg( 'error', $lang['comments:comments'], $lang['comments:msg.not_found'], '?mod=extra-config&plugin=comments&action=list' );
        }

        //
        // Проверка из базы данных
        $approve = intval($comment['approve']);
        $authorID = intval($comment['author_id']);
        $post = intval($comment['post']);

        // Если модерации нет или если модерация есть и комментарий одобрен
        if (!$moderate or ($moderate and $approve)) {
            $mysql->query("update `".prefix."_news` set com=com-1 where id=".db_squote($post));
            $mysql->query("update `".uprefix."_users` set com=com-1 where id=".db_squote($authorID));
        }

        $mysql->query("delete from ".prefix."_comments where id=".db_squote($comid));
    }

	msg(['type' => 'info', 'text' => $lang['comments:msg.done'], 'info' => ((count($commentsArray) > 1) ? $lang['comments:msg.deleted_all'] : $lang['comments:msg.deleted'])]);
	return print_msg( 'delete', $lang['comments:comments'], ((count($commentsArray) > 1) ? $lang['comments:msg.deleted_all'] : $lang['comments:msg.deleted']), '?mod=extra-config&plugin=comments&action=list' );

}

// Массовая функция для одобрения или запрета комментариев
function pluginListUpdateAction($plugin, $action, $subaction) {
    global $mysql, $config, $lang;

/* Если делать принудительную модерацию комментов (а так как стоит функция пометить как прочитанное, такое не доступно)
     $moderate = (1 == pluginGetVariable('comments', 'moderate')) ? true : false;
    if (!$moderate) {
        msg(['type' => 'info', 'text' => $lang['comments:msg.moderate_not_used']]);
        return;
    } */
	
    $commentsNotFound = [];
    $commentsUpdated = [];

    // comment ID не найден
    if (empty($_REQUEST['comid']) and empty($_REQUEST['selected_comments']) and !count($_REQUEST['selected_comments'])) {
        msg(['type' => 'danger', 'text' => $lang['comments:comid_not_found']]);
        return;
    }

    $commentsArray = !empty($_REQUEST['comid']) ? ['0' => $_REQUEST['comid']] : $_REQUEST['selected_comments'];

    foreach ($commentsArray as $comid) {

        $comid = intval($comid);

        // Find comment in DB
        if (!is_array($comment = $mysql->record("select * from `".prefix."_comments` where id = ".db_squote($comid)))) {
            msg(['type' => 'danger', 'text' => "# $comid - " . $lang['comments:msg.not_found']]);
            $commentsNotFound[] = "# $comid - " . $lang['comments:msg.not_found'];
            continue;
        }

        $approve = intval($comment['approve']);
        $authorID = intval($comment['author_id']);
        $post = intval($comment['post']);

        if ('mass_approve' == $subaction) {
            if (0 == $approve) {
                $mysql->query("UPDATE `".prefix."_news` SET com=com+1 where id=".db_squote($post));
                if ($authorID)
                    $mysql->query("UPDATE `".uprefix."_users` SET com=com+1 where id=".db_squote($authorID));

                $mysql->query("UPDATE ".prefix."_comments SET approve='1' where id=".db_squote($comid));
                $commentsUpdated[] = "# $comid - " . $lang['comments:msg.'.$subaction];
            } elseif (1 == $approve) {
                $commentsUpdated[] = "# $comid - " . $lang['comments:msg.'.$subaction.'_already'];
            }
        }

        if ('mass_forbidden' == $subaction) {
            if (0 == $approve) {
                $commentsUpdated[] = "# $comid - " . $lang['comments:msg.'.$subaction.'_already'];
            } elseif (1 == $approve) {
                $mysql->query("UPDATE `".prefix."_news` SET com=com-1 where id=".db_squote($post));
                if ($authorID)
                    $mysql->query("UPDATE `".uprefix."_users` SET com=com-1 where id=".db_squote($authorID));

                $mysql->query("UPDATE ".prefix."_comments SET approve='0' where id=".db_squote($comid));
                $commentsUpdated[] = "# $comid - " . $lang['comments:msg.'.$subaction];
            }
        }
    }

    if (count($commentsUpdated)) {
        msg(['type' => 'info', 'text' => implode('<br />', $commentsUpdated)]);
		return print_msg( 'info', $lang['comments:comments'], implode('<br />', $commentsUpdated), '?mod=extra-config&plugin=comments&action=list' );
    } elseif (count($commentsNotFound)) {
		msg(['type' => 'danger', 'text' => implode('<br />', $commentsNotFound)]);
		return print_msg( 'error', $lang['comments:comments'], implode('<br />', $commentsNotFound), '?mod=extra-config&plugin=comments&action=list' );
    }
}

function main($plugin, $action){
global $config, $mysql, $twig, $parse, $breadcrumb, $lang;
	
	$breadcrumb = breadcrumb('<i class="fa fa-comments-o btn-position"></i><span class="text-semibold">'.$lang['comments:comments'].'</span>', array('?mod=extras' => '<i class="fa fa-puzzle-piece btn-position"></i>'.$lang['extras'].'', '<i class="fa fa-comments-o btn-position"></i>'.$lang['comments:comments'].'' ) );

	$tpath = locatePluginTemplates(array('main', 'general.from'), 'comments', 1);

	$xt = $twig->loadTemplate($tpath['general.from'].'general.from.tpl');
	$tVars = array();
	$xg = $twig->loadTemplate($tpath['main'].'main.tpl');

	if (isset($_REQUEST['submit'])) {
		pluginSetVariable($plugin, 'regonly', intval($_REQUEST['regonly']));
		pluginSetVariable($plugin, 'moderate', (int)$_REQUEST['moderate']);
		pluginSetVariable($plugin, 'guest_edup_lock', (int)$_REQUEST['guest_edup_lock']);
		pluginSetVariable($plugin, 'backorder', (int)$_REQUEST['backorder']);
		pluginSetVariable($plugin, 'minlen', secure_html(trim($_REQUEST['minlen'])));
		pluginSetVariable($plugin, 'maxlen', secure_html(trim($_REQUEST['maxlen'])));
		pluginSetVariable($plugin, 'maxwlen', secure_html(trim($_REQUEST['maxwlen'])));
		pluginSetVariable($plugin, 'multi', (int)$_REQUEST['multi']);
		pluginSetVariable($plugin, 'author_multi', (int)$_REQUEST['author_multi']);
		pluginSetVariable($plugin, 'timestamp', secure_html(trim($_REQUEST['timestamp'])));
		pluginSetVariable($plugin, 'global_default', (int)$_REQUEST['global_default']);
		pluginSetVariable($plugin, 'default_news', (int)$_REQUEST['default_news']);
		pluginSetVariable($plugin, 'default_categories', (int)$_REQUEST['default_categories']);
		pluginSetVariable($plugin, 'multipage', (int)$_REQUEST['multipage']);
		pluginSetVariable($plugin, 'multi_mcount', intval($_REQUEST['multi_mcount']));
		pluginSetVariable($plugin, 'multi_scount', intval($_REQUEST['multi_scount']));
		pluginSetVariable($plugin, 'inform_author', (int)$_REQUEST['inform_author']);
		pluginSetVariable($plugin, 'inform_admin', (int)$_REQUEST['inform_admin']);
		
		pluginsSaveConfig();
		msg(array("type" => "info", "info" => "Настройки успешно сохранены!"));
		return print_msg( 'info', $lang['comments:comments'], 'Настройки успешно сохранены!', '?mod=extra-config&plugin=comments' );
	}
	
	$minlen = pluginGetVariable($plugin, 'minlen');
	$maxlen = pluginGetVariable($plugin, 'maxlen');
	$maxwlen = pluginGetVariable($plugin, 'maxwlen');
	$timestamp = pluginGetVariable($plugin, 'timestamp');
	$multi_mcount = pluginGetVariable($plugin, 'multi_mcount');
	$multi_scount = pluginGetVariable($plugin, 'multi_scount');

	$pvars = array (
		'regonly'      		 => MakeDropDown(array(0 => $lang['noa'], 1 => $lang['yesa']), 'regonly', (int)pluginGetVariable($plugin, 'regonly')),
		'moderate'      	 => MakeDropDown(array(0 => $lang['noa'], 1 => $lang['yesa']), 'moderate', (int)pluginGetVariable($plugin, 'moderate')),
		'guest_edup_lock' 	 => MakeDropDown(array(0 => $lang['noa'], 1 => $lang['yesa']), 'guest_edup_lock', (int)pluginGetVariable($plugin, 'guest_edup_lock')),
		'backorder' 		 => MakeDropDown(array(0 => $lang['comments:backorder#0'], 1 => $lang['comments:backorder#1']), 'backorder', (int)pluginGetVariable($plugin, 'backorder')),
		'minlen' 			 => $minlen,
		'maxlen' 			 => $maxlen,
		'maxwlen' 			 => $maxwlen,
		'multi' 			 => MakeDropDown(array(0 => $lang['noa'], 1 => $lang['yesa']), 'multi', (int)pluginGetVariable($plugin, 'multi')),
		'author_multi' 		 => MakeDropDown(array(0 => $lang['noa'], 1 => $lang['yesa']), 'author_multi', (int)pluginGetVariable($plugin, 'author_multi')),
		'timestamp' 		 => $timestamp,
		'global_default' 	 => MakeDropDown(array(0 => $lang['comments:global_default#0'], 1 => $lang['comments:global_default#1']), 'global_default', (int)pluginGetVariable($plugin, 'global_default')),
		'default_news' 		 => MakeDropDown(array(0 => $lang['comments:default_news#0'], 1 => $lang['comments:default_news#1'], 2 => $lang['comments:default_news#2']), 'default_news', (int)pluginGetVariable($plugin, 'default_news')),
		'default_categories' => MakeDropDown(array(0 => $lang['comments:default_categories#0'], 1 => $lang['comments:default_categories#1'], 2 => $lang['comments:default_categories#2']), 'default_categories', (int)pluginGetVariable($plugin, 'default_categories')),
		'multipage' 		 => MakeDropDown(array(0 => $lang['noa'], 1 => $lang['yesa']), 'multipage', (int)pluginGetVariable($plugin, 'multipage')),
		'multi_mcount' 		 => $multi_mcount,
		'multi_scount' 		 => $multi_scount,
		'inform_author' 	 => MakeDropDown(array(0 => $lang['noa'], 1 => $lang['yesa']), 'inform_author', (int)pluginGetVariable($plugin, 'inform_author')),
		'inform_admin' 	 	 => MakeDropDown(array(0 => $lang['noa'], 1 => $lang['yesa']), 'inform_admin', (int)pluginGetVariable($plugin, 'inform_admin')),
				
	);
	
	$tVars = array(
		'active1' => 'active',
		'entries' => $xt->render($pvars)
	);
	
	print $xg->render($tVars);
	
}