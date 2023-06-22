<?php
# protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

pluginsLoadConfig();
loadPluginLang('auth_punbb', 'config', '', '', ':');
$db_update = array(
	array(
		'table'  => 'users',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'drop', 'name' => 'punbb_userid'),
			array('action' => 'drop', 'name' => 'punbb_newpw')
		)
	),
);
if ($_REQUEST['action'] == 'commit') {
	if (fixdb_plugin_install('auth_punbb', $db_update, 'deinstall')) {
		plugin_mark_deinstalled('auth_punbb');
	}
} else {
	generate_install_page('auth_punbb', $lang['auth_punbb:uninstall'], 'deinstall');
}