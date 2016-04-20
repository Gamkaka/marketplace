<?php

/**
 * Rules integration hooks.
 */

/**
 * Implements hook_rules_event_info().
 * @ingroup rules
 */
function emh_points_rules_event_info() {
  $events = array();
  $events['emh_points_points_will_expire'] = array(
    'label' => t('Points will expire in month'),
    'module' => 'emh_points',
    'group' => t('Points'),
    'variables' => array(
      'points' => array('type' => 'integer', 'label' => t('Number of points that will expire')),
      'owner' => array('type' => 'user', 'label' => t('Owner of the points')),
    ),
  );
  $events['emh_points_new_points'] = array(
    'label' => t('Points are added'),
    'module' => 'emh_points',
    'group' => t('Points'),
    'variables' => array(
      'points' => array('type' => 'integer', 'label' => t('Number of points that have been transfered')),
      'owner' => array('type' => 'user', 'label' => t('Owner of the points')),
    ),
  );
  return $events;
}

/**
 * Implements hook_rules_condition_info().
 * @ingroup rules
 */
function emh_points_rules_condition_info() {
  $conditions = array();
  $conditions['emh_points_user_has_enough_points'] = array(
    'label' => t('User has enough points'),
    'module' => 'emh_points',
    'group' => t('Points'),
    'parameter' => array(
      'owner' => array('type' => 'user', 'label' => t('Owner of the points')),
      'points' => array('type' => 'integer', 'label' => t('Number of points to validate')),
    ),
  );
  return $conditions;
}

/**
 * Callback for some Rules condition.
 */
function emh_points_user_has_enough_points($user, $points) {
  $current_points = 0;
  $query = db_select('emh_points', 'p')
    ->condition('p.entity_type', 'user')
    ->condition('p.entity_id', $user->uid);
  $query->addExpression('SUM(p.points)');
  $current_points = $query->execute()->fetchField();
  return ($current_points >= $points);
}

/**
 * Implements hook_rules_action_info().
 * @ingroup rules
 */
function emh_points_rules_action_info() {
  $actions = array();
  $actions['move_points'] = array(
    'label' => t('Move points'),
    'group' => t('Points'),
    'base' => 'emh_points_move_points',
    'parameter' => array(
      'source' => array('label' => t('Source'), 'type' => 'entity'),
      'destination' => array('label' => t('Destination'), 'type' => 'entity'),
      'points' => array('label' => t('Number of points to move'), 'type' => 'integer'),
    ),
  );
  return $actions;
}