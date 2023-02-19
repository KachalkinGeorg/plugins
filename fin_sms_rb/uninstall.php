<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
pluginsLoadConfig();
$db_update = array(
	array(
		'table'  => 'smsrb_price',
		'action' => 'drop',
	),
	array(
		'table'  => 'smsrb_incoming',
		'action' => 'drop',
	),
	array(
		'table'  => 'smsrb_history',
		'action' => 'drop',
	),
);
if ($_REQUEST['action'] == 'commit') {
	if (fixdb_plugin_install($plugin, $db_update, 'deinstall')) {
		plugin_mark_deinstalled($plugin);
	}
} else {
	generate_install_page($plugin, 'Удаление плагина <b>fin_sms_rb</b>', 'deinstall');
}
?>