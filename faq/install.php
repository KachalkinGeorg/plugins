<?php
if (!defined('NGCMS')) die ('HAL');
function plugin_faq_install($action) {

	global $mysql;
	$install = true;
	$db_update = array(
		array(
			'table'  => 'faq',
			'action' => 'cmodify',
			'engine' => 'MyISAM',
			'key'    => 'primary key(id)',
			'fields' => array(
				array('action' => 'cmodify', 'name' => 'id', 'type' => 'INT(10)', 'params' => 'UNSIGNED NOT NULL AUTO_INCREMENT'),
				array('action' => 'cmodify', 'name' => 'question', 'type' => 'text', 'params' => 'NOT NULL'),
				array('action' => 'cmodify', 'name' => 'answer', 'type' => 'text', 'params' => 'NOT NULL'),
				array('action' => 'cmodify', 'name' => 'active', 'type' => 'tinyint(1)', 'params' => 'UNSIGNED NOT NULL DEFAULT "0"'),
			)
		),
	);
	switch ($action) {
		case 'confirm':
			generate_install_page('faq', 'Всё готово к установке.');
			break;
		case 'apply':
			if ($install) {
				if (fixdb_plugin_install('faq', $db_update, 'install', ($action == 'autoapply') ? true : false)) {
					plugin_mark_installed('faq');
				} else return false;
			} else return false;
			extra_commit_changes();
			break;
	}

	return true;
}