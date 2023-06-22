<?php

// #====================================================================================#
// # Наименование плагина: auth_vb [ vBulletin auth DB module ]                         #
// # Разрешено к использованию с: NGCMS                                                 #
// # Автор: Vitaly A Ponomarev, vp7@mail.ru                                             #
// #====================================================================================#

// #====================================================================================#
// # Инсталл скрипт плагина                                                             #
// #====================================================================================#

if (!defined('NGCMS')) die ('HAL');
function plugin_auth_vb_install($action) {

	global $lang;
	loadPluginLang('auth_vb', 'config', '', '', ':');
$db_update = array(
 array(
  'table'  => 'users',
  'action' => 'modify',
  'fields' => array(
    array('action' => 'cmodify', 'name' => 'vb_userid', 'type' => 'int'),
  )
 ),
);


if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	if (fixdb_plugin_install('auth_vb', $db_update)) {
		plugin_mark_installed('auth_vb');
	}	
} else {
	generate_install_page('auth_vb', $lang['auth_vb:install']);
}
}
?>