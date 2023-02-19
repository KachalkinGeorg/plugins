<?php
if (!defined('NGCMS')) die ('Galaxy in danger');
function plugin_auth_social_install($action) {

	$db_create = array(
		array(
			'table'  => 'users',
			'action' => 'cmodify',
			'fields' => array(
				array('action' => 'cmodify', 'name' => 'provider', 'type' => 'varchar(255)', 'params' => 'DEFAULT \'\''),
				array('action' => 'cmodify', 'name' => 'social_id', 'type' => 'text', 'params' => 'NOT NULL'),
				array('action' => 'cmodify', 'name' => 'social_page', 'type' => 'text', 'params' => 'NOT NULL'),
				array('action' => 'cmodify', 'name' => 'sex', 'type' => 'varchar(255)', 'params' => 'DEFAULT \'\''),
				array('action' => 'cmodify', 'name' => 'birthday', 'type' => 'varchar(255)', 'params' => 'DEFAULT \'\''),
			)
		)
	);
	switch ($action) {
		case 'confirm':
			generate_install_page('auth_social', 'Плагин авторизация через vk, odnoklassniki, mailru, yandex, google, facebook, twitter, steam - это дополнение к плагину auth_basic!!!<br>Cейчас плагин будет установлен');
			break;
		case 'autoapply':
		case 'apply':
			if (fixdb_plugin_install('auth_social', $db_create, 'install', ($action == 'autoapply') ? true : false)) {
				plugin_mark_installed('auth_social');
			} else {
				return false;
			}
			break;
	}

	return true;
}