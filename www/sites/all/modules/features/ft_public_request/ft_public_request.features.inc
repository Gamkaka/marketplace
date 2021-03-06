<?php
/**
 * @file
 * ft_public_request.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function ft_public_request_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_views_api().
 */
function ft_public_request_views_api($module = NULL, $api = NULL) {
  return array("api" => "3.0");
}

/**
 * Implements hook_node_info().
 */
function ft_public_request_node_info() {
  $items = array(
    'public_request' => array(
      'name' => t('Public request'),
      'base' => 'node_content',
      'description' => '',
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}
