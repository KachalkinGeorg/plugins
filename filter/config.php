<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
// Preload config file
pluginsLoadConfig();

if (!getPluginStatusActive('comments')) {
	msg(['type' => 'error', 'Для работы фильтра требуется ниличия плагина <strong>comments</strong>.']);
	return print_msg( 'warning', 'Фильтрация нежелательных слов в комментариях', 'Внимание!<br>Плагин <strong>comments</strong> не был установлен. Для использования этого дополнения, необходимо установить плагин <a href="?mod=extra-config&plugin=comments">comments</a>', '?mod=extras' );
}

// Fill configuration parameters
$cfg = array();
array_push($cfg, array('descr' => 'С помощью данного плагина Вы можете фильтровать нежелательные слова в комментариях, выполнять замену нежелательных слов (мата, например) или запрещать размещение комментариев содержащих определённые последовательности (к примеру, ссылки)<br><br><br>'));
array_push($cfg, array('name' => 'replace', 'title' => "Замена слов<br><br><i>На каждой строке вводится по одному слову а после символа '|' - то, на что оно заменяется.</i><br>Пример:<br>блять|бл#ть", 'type' => 'text', 'html_flags' => 'rows=8 cols=60', 'value' => extra_get_param('filter', 'replace')));
array_push($cfg, array('name' => 'block', 'title' => "Блокировка слов<br><br><i>На каждой строке вводится по одной текстовой последовательности. Если эта последовательность встречается в тексте комментария, то комментарий блокируется.</i>", 'type' => 'text', 'html_flags' => 'rows=8 cols=60', 'value' => extra_get_param('filter', 'block')));
//array_push($cfg, array('name' => 'template', 'title' => 'Шаблон заполнения','type' => 'text', 'html_flags' => 'rows=8 cols=60', 'value' => extra_get_param('test','template')));
// RUN 
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes('filter', $cfg);
} else {
	generate_config_page('filter', $cfg);
}
