<?php
/**
 * @file
 * ft_permissions.features.user_role.inc
 */

/**
 * Implements hook_user_default_roles().
 */
function ft_permissions_user_default_roles() {
  $roles = array();

  // Exported role: administrator.
  $roles['administrator'] = array(
    'name' => 'administrator',
    'weight' => 2,
  );

  // Exported role: business.
  $roles['business'] = array(
    'name' => 'business',
    'weight' => 4,
  );

  // Exported role: business preview.
  $roles['business preview'] = array(
    'name' => 'business preview',
    'weight' => 8,
  );

  // Exported role: expert.
  $roles['expert'] = array(
    'name' => 'expert',
    'weight' => 3,
  );

  // Exported role: expert preview.
  $roles['expert preview'] = array(
    'name' => 'expert preview',
    'weight' => 7,
  );

  // Exported role: référent.
  $roles['référent'] = array(
    'name' => 'référent',
    'weight' => 6,
  );

  // Exported role: webmaster.
  $roles['webmaster'] = array(
    'name' => 'webmaster',
    'weight' => 5,
  );

  return $roles;
}