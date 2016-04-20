<?php

function emindhub_preprocess_node(&$variables, $hook) {
	if (isset($variables['node']->type)) {
		$function = __FUNCTION__ . '__' . $variables['node']->type;
		if (function_exists($function)) {
			$function($variables, $hook);
		}
	}
}

function emindhub_preprocess_node__challenge(&$variables) {
	node_informations_add($variables);
}

// function emindhub_preprocess_node__question(&$variables) {
// 	node_informations_add($variables);
// }

function emindhub_preprocess_node__question1(&$variables) {
	node_informations_add($variables);
}

function emindhub_preprocess_node__webform(&$variables) {
	node_informations_add($variables);
}


function node_informations_add(&$variables) {

	// Views navigation between nodes
	$variables['linkBack'] = '';
	$variables['linkPrev'] = '';
	$variables['linkNext'] = '';
	// echo '<pre>' . print_r($variables['elements']['links']['views_navigation']['#links']['back'], TRUE) . '</pre>';
	if (!empty($variables['elements']['links']['views_navigation']['#links']['back'])) $variables['linkBack'] = $variables['elements']['links']['views_navigation']['#links']['back'];
	if (!empty($variables['elements']['links']['views_navigation']['#links']['previous'])) $variables['linkPrev'] = $variables['elements']['links']['views_navigation']['#links']['previous'];
	if (!empty($variables['elements']['links']['views_navigation']['#links']['next'])) $variables['linkNext'] = $variables['elements']['links']['views_navigation']['#links']['next'];

	// User profile infos
	$variables['company_name'] = '';
	$variables['company_description'] = '';
	$variables['user_name'] = '';

	if (!empty($variables['elements']['body'])) {
		$user = user_load_by_name($variables['elements']['body']['#object']->name);
		$account = user_load($user->uid);

		if ($account) {
			$firstName = '';
			if (!empty($account->field_first_name[LANGUAGE_NONE])) {
				$firstName = check_plain($account->field_first_name[LANGUAGE_NONE][0]['value']);
			}
			$lastName = '';
			if (!empty($account->field_last_name[LANGUAGE_NONE])) {
				$lastName = check_plain($account->field_last_name[LANGUAGE_NONE][0]['value']);
			}
			$variables['user_name'] = $lastName . '&nbsp;' . $firstName;

			if ($account->field_entreprise) {
				$targetId = $account->field_entreprise[LANGUAGE_NONE][0]['target_id'];
				$entity = node_load($targetId);
        // echo '<pre>' . print_r($entity, TRUE) . '</pre>'; die;
				if ($entity) {
					$variables['company_name'] = check_plain($entity->title);
					if ($entity->body) {
						$variables['company_description'] = check_plain($entity->body[LANGUAGE_NONE][0]['value']);
                                        }
				}
			}
		}
	}

	$nid = arg(1);
	if ( (!empty($nid)) && module_exists('emh_request') ) $variables['request_status'] = emh_request_get_status($nid);

	// echo '<pre>' . print_r($variables, TRUE) . '</pre>';

}


function emindhub_node_view_alter( &$build ) {

	// echo '<pre>' . print_r($build, TRUE) . '</pre>';
  // if ($build['#view_mode'] == 'teaser') {
    // remove "add comment" link from node teaser mode display
    unset($build['links']['comment']['#links']['comment-add']);
    // and if logged out this will cause another list item to appear, so let's get rid of that
    unset($build['links']['comment']['#links']['comment_forbidden']);
  // }

}


// function emindhub_comment_view_alter( &$build ) {
//
// 	// echo '<pre>' . print_r($build['links'], TRUE) . '</pre>';
//   // if ($build['#view_mode'] == 'teaser') {
//     // remove "add comment" link from node teaser mode display
//     unset($build['links']['comment']['#links']['comment-add']);
//     // and if logged out this will cause another list item to appear, so let's get rid of that
//     unset($build['links']['comment']['#links']['comment_forbidden']);
//   // }
//
// }