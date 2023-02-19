<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
pluginsLoadConfig();
$db_update = array(
	array(
		'table'  => 'users',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'drop', 'name' => 'balance'),
			array('action' => 'drop', 'name' => 'balance1'),
			array('action' => 'drop', 'name' => 'balance2'),
			array('action' => 'drop', 'name' => 'balance3'),
			array('action' => 'drop', 'name' => 'balance4'),
		)
	),
	array(
		'table'  => 'news',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'drop', 'name' => 'fin_price'),
		)
	),
	array(
		'table'  => 'balance_manager',
		'action' => 'drop',
	),
	array(
		'table'  => 'subscribe_manager',
		'action' => 'drop',
	),
	array(
		'table'  => 'finance_history',
		'action' => 'drop',
	),
	array(
		'table'  => 'finance_history',
		'action' => 'drop',
	),
);
if ($_REQUEST['action'] == 'commit') {
	if (fixdb_plugin_install($plugin, $db_update, 'deinstall')) {
		plugin_mark_deinstalled($plugin);
	}
} else {
	generate_install_page($plugin, 'Удаление плагина', 'deinstall');
}
?>