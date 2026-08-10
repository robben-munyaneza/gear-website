<?php

/**
 * Fonctions utiles pour les wheels SPIP
 *
 * @SPIP\Textwheel\Wheel\SPIP\Fonctions
 **/

if (!defined('_ECRIRE_INC_VERSION')) {
	return;
}

include_spip('inc/texte');

function replace_backticks($match) {

	$ticks = $match[1];
	$code = $match[2];
	$after = $match[4] ?? '';

	if (strlen($ticks) === 3) {
		$langage = '';
		if (preg_match(",^[\w]+(\r\n?|\n),is", $code, $r)) {
			$langage = rtrim($r[0]);
			$code = substr($code, strlen($langage));
		}
		// pas de premier saut de ligne
		$code = preg_replace(',^(\r\n?|\n),', '', $code, 1);
		$html = spip_balisage_code($code, true, '', $langage);
		$mode = "div";
	}
	else {
		// span code
		$html = spip_balisage_code(trim($code), false);
		$mode = "span";

	}

	$html = code_echappement($html, '', false, $mode);

	return $html . $after;
}
