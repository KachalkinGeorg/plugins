<?php
# protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

pluginsLoadConfig();
loadPluginLang('auth_vb', 'config', '', '', ':');
$db_update = array(
	array(
		'table'  => 'users',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'drop', 'name' => 'vb_userid')
		)
	),
);
if ($_REQUEST['action'] == 'commit') {
	if (fixdb_plugin_install('auth_vb', $db_update, 'deinstall')) {
		plugin_mark_deinstalled('auth_vb');
	}
} else {
	generate_install_page('auth_vb', $lang['auth_vb:uninstall'], 'deinstall');
}