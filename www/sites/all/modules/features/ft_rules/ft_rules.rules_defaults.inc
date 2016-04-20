<?php
/**
 * @file
 * ft_rules.rules_defaults.inc
 */

/**
 * Implements hook_default_rules_configuration().
 */
function ft_rules_default_rules_configuration() {
  $items = array();
  $items['rules_add_expert_role_on_hybridauth'] = entity_import('rules_config', '{ "rules_add_expert_role_on_hybridauth" : {
      "LABEL" : "Add \\u0022Expert\\u0022 role on hybridauth",
      "PLUGIN" : "reaction rule",
      "ACTIVE" : false,
      "OWNER" : "rules",
      "TAGS" : [ "emh" ],
      "REQUIRES" : [ "rules", "hybridauth" ],
      "ON" : { "hybridauth_user_insert" : [] },
      "DO" : [
        { "user_add_role" : {
            "account" : [ "hybridauth-user" ],
            "roles" : { "value" : { "8" : "8" } }
          }
        }
      ]
    }
  }');
  $items['rules_auto_subscribe_to_general_group'] = entity_import('rules_config', '{ "rules_auto_subscribe_to_general_group" : {
      "LABEL" : "Auto subscribe to general group",
      "PLUGIN" : "reaction rule",
      "ACTIVE" : false,
      "OWNER" : "rules",
      "REQUIRES" : [ "rules", "og" ],
      "ON" : { "user_insert" : [], "user_update" : [] },
      "IF" : [
        { "user_has_role" : { "account" : [ "account" ], "roles" : { "value" : { "4" : "4" } } } }
      ],
      "DO" : [
        { "og_group_content_add" : { "entity" : [ "account" ], "group" : "node:205" } }
      ]
    }
  }');
  $items['rules_on_hybridauth_register'] = entity_import('rules_config', '{ "rules_on_hybridauth_register" : {
      "LABEL" : "On hybridauth register",
      "PLUGIN" : "reaction rule",
      "OWNER" : "rules",
      "REQUIRES" : [ "rules", "hybridauth" ],
      "ON" : { "hybridauth_user_insert" : [] },
      "DO" : [
        { "data_set" : {
            "data" : [ "hybridauth-user:field-first-name" ],
            "value" : [ "hybridauth:firstName" ]
          }
        },
        { "data_set" : {
            "data" : [ "hybridauth-user:field-last-name" ],
            "value" : [ "hybridauth:lastName" ]
          }
        },
        { "data_set" : { "data" : [ "hybridauth-user:mail" ], "value" : [ "hybridauth:email" ] } },
        { "user_add_role" : {
            "account" : [ "hybridauth-user" ],
            "roles" : { "value" : { "4" : "4" } }
          }
        }
      ]
    }
  }');
  $items['rules_pre_subscribe_membres'] = entity_import('rules_config', '{ "rules_pre_subscribe_membres" : {
      "LABEL" : "Pre subscribe members to new Circles",
      "PLUGIN" : "reaction rule",
      "ACTIVE" : false,
      "OWNER" : "rules",
      "TAGS" : [ "Circle", "EMH" ],
      "REQUIRES" : [ "og", "rules" ],
      "ON" : { "node_insert--circle" : { "bundle" : "circle" } },
      "DO" : [
        { "LOOP" : {
            "USING" : { "list" : [ "node:field-pre-members" ] },
            "ITEM" : { "list_item" : "Current list item" },
            "DO" : [
              { "og_subcribe_user" : { "user" : [ "list-item" ], "group" : [ "node" ] } }
            ]
          }
        }
      ]
    }
  }');
  $items['rules_subscription_to_group_email'] = entity_import('rules_config', '{ "rules_subscription_to_group_email" : {
      "LABEL" : "Subscription to group email",
      "PLUGIN" : "reaction rule",
      "ACTIVE" : false,
      "OWNER" : "rules",
      "TAGS" : [ "Circle", "email", "EMH" ],
      "REQUIRES" : [ "rules", "og" ],
      "ON" : { "og_user_insert" : [] },
      "DO" : [
        { "mail" : {
            "to" : [ "account:mail" ],
            "subject" : "Welcome to [og-membership:group:title]",
            "message" : "Welcome to the group [og-membership:group:title]",
            "from" : "[site:mail]",
            "language" : [ "account:language" ]
          }
        }
      ]
    }
  }');
  return $items;
}