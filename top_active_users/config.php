<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
// Preload config file
pluginsLoadConfig();
LoadPluginLang($plugin, 'config', '', '', ':');
//LoadPluginLang($plugin, 'main', '', 'topusers');
// Fill configuration parameters
$cfg = array();
$cfgX = array();
//array_push($cfg, array('descr' => $lang['topusers_descr']));
array_push($cfg, array('descr' => $lang['top_active_users:description']));
$cfgX = array();
array_push($cfgX, array('name' => 'localsource', 'title' => $lang['top_active_users:localsource'], 'descr' => $lang['top_active_users:localsource#desc'], 'type' => 'select', 'values' => array('0' => 'Шаблон сайта', '1' => 'Плагин'), 'value' => intval(pluginGetVariable($plugin, 'localsource'))));
array_push($cfg, array('mode' => 'group', 'title' => $lang['top_active_users:group.source'], 'entries' => $cfgX));
// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
} else {
	generate_config_page($plugin, $cfg);
}
?>