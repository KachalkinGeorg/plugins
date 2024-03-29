<?php

// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

register_plugin_page('gsmg', '', 'plugin_gsmg_screen', 0);

// Load library
include_once(root . "/plugins/gsmg/lib/common.php");

function plugin_gsmg_screen() {
    global $config, $mysql, $catz, $catmap, $SUPRESS_TEMPLATE_SHOW, $SYSTEM_FLAGS, $PFILTERS;

    $SUPRESS_TEMPLATE_SHOW = 1;
    $SUPRESS_MAINBLOCK_SHOW = 1;

	@header('Content-type: text/xml; charset=utf-8');
	$SYSTEM_FLAGS['http.headers'] = array(
		'content-type'  => 'application/xml; charset=utf-8',
		'cache-control' => 'private',
	);

    if (extra_get_param('gsmg', 'cache')) {
        $cacheData = cacheRetrieveFile('gsmg.xml', extra_get_param('gsmg', 'cacheExpire'), 'gsmg');
        if ($cacheData != false) {
            // We got data from cache. Return it and stop
            print $cacheData;

            return;
        }
    }
    $output = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n";

    // Настройки постранички
    if ($config['number'] < 1)
        $config['number'] = 5;
    // Надо ли выводить данные с головной страницы
    if (extra_get_param('gsmg', 'main')) {
		$loc = generateLink('news', 'main', array(), array(), false, true);
		$link = htmlspecialchars($loc);
        $output .= "\t<url>\n";
        $output .= "\t\t<loc>" . $link . "</loc>\n";
        $lm = $mysql->record("select date(from_unixtime(max(postdate))) as pd from " . prefix . "_news");
        $output .= "\t\t<lastmod>" . $lm['pd'] . "</lastmod>\n";
        $output .= "\t\t<priority>" . floatval(extra_get_param('gsmg', 'main_pr')) . "</priority>\n";
        $output .= "\t\t<changefreq>daily</changefreq>\n";
        $output .= "\t</url>\n";
        if (extra_get_param('gsmg', 'mainp')) {
            $cnt = $mysql->record("select count(*) as cnt from " . prefix . "_news");
            $pages = ceil($cnt['cnt'] / $config['number']);
            for ($i = 2; $i <= $pages; $i++) {
				$loc = generateLink('news', 'main', array('page' => $i), array(), false, true);
				$link = htmlspecialchars($loc);
                $output .= "\t<url>\n";
                $output .= "\t\t<loc>" . $link . "</loc>\n";
                $output .= "\t\t<lastmod>" . $lm['pd'] . "</lastmod>\n";
                $output .= "\t\t<priority>" . floatval(extra_get_param('gsmg', 'mainp_pr')) . "</priority>\n";
                $output .= "\t\t<changefreq>daily</changefreq>\n";
                $output .= "\t</url>\n";
            }
        }
    }

    // Надо ли выводить данные по категориям
    if (extra_get_param('gsmg', 'cat')) {
        foreach ($catmap as $id => $altname) {
			$loc = generateLink('news', 'by.category', array('category' => $altname, 'catid' => $id), array(), false, true);
			$link = htmlspecialchars($loc);
            $output .= "\t<url>\n";
            $output .= "\t\t<loc>" . $link . "</loc>\n";
            $output .= "\t\t<lastmod>" . $lm['pd'] . "</lastmod>\n";
            $output .= "\t\t<priority>" . floatval(extra_get_param('gsmg', 'cat_pr')) . "</priority>\n";
            $output .= "\t\t<changefreq>daily</changefreq>\n";
            $output .= "\t</url>\n";
            if (extra_get_param('gsmg', 'catp')) {
                $cn = ($catz[$altname]['number'] > 0) ? $catz[$altname]['number'] : $config['number'];
                $pages = ceil($catz[$altname]['posts'] / $cn);
                for ($i = 2; $i <= $pages; $i++) {
					$loc = generateLink('news', 'by.category', array('category' => $altname, 'catid' => $id, 'page' => $i), array(), false, true);
					$link = htmlspecialchars($loc);
                    $output .= "\t<url>\n";
                    $output .= "\t\t<loc>" . $link . "</loc>\n";
                    $output .= "\t\t<lastmod>" . $lm['pd'] . "</lastmod>\n";
                    $output .= "\t\t<priority>" . floatval(extra_get_param('gsmg', 'catp_pr')) . "</priority>\n";
                    $output .= "\t\t<changefreq>daily</changefreq>\n";
                    $output .= "\t</url>\n";
                }
            }
        }
    }

    // Надо ли выводить данные по новостям
    if (extra_get_param('gsmg', 'news')) {
        $query = "select id, postdate, author, author_id, alt_name, editdate, catid from " . prefix . "_news where approve = 1 order by id desc";
        foreach ($mysql->select($query, 1) as $rec) {
            $loc = newsGenerateLink($rec, false, 0, true);
			$link = htmlspecialchars($loc);
            $output .= "\t<url>\n";
            $output .= "\t\t<loc>" . $link . "</loc>\n";
            $output .= "\t\t<lastmod>" . strftime("%Y-%m-%d", max($rec['editdate'], $rec['postdate'])) . "</lastmod>\n";
            $output .= "\t\t<priority>" . floatval(extra_get_param('gsmg', 'news_pr')) . "</priority>\n";
            $output .= "\t\t<changefreq>daily</changefreq>\n";
            $output .= "\t</url>\n";
			
        }
    }

    // Надо ли выводить данные по статическим страницам
    if (extra_get_param('gsmg', 'static')) {
        $query = "select id, alt_name from " . prefix . "_static where approve = 1";
        foreach ($mysql->select($query, 1) as $rec) {
            $loc = generatePluginLink('static', '', array('altname' => $rec['alt_name'], 'id' => $rec['id']), array(), false, true);
			$link = htmlspecialchars($loc);
            $output .= "\t<url>\n";
            $output .= "\t\t<loc>" . $link . "</loc>\n";
            $output .= "\t\t<lastmod>" . $lm['pd'] . "</lastmod>\n";
            $output .= "\t\t<priority>" . floatval(extra_get_param('gsmg', 'static_pr')) . "</priority>\n";
            $output .= "\t\t<changefreq>weekly</changefreq>\n";
            $output .= "\t</url>\n";
        }
    }
    if (is_array($PFILTERS['gsmg']))
        foreach ($PFILTERS['gsmg'] as $k => $v) {
            $v->onShow($output);
        }
    $output .= "</urlset>";
    print $output;
    cacheStoreFile('gsmg.xml', $output, 'gsmg');
}
