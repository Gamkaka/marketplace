<?php
/**
 * @file
 * Displays a user alert.
 *
 * Available variables:
 * - $alert_label: The label of the alert, as set in the User Alerts settings.
 * - $body: The user alert message.
 *
 * @ingroup themeable
 */
?>

<div id="user-alert-<?php print $nid; ?>" class="user-alert">

  <?php if ($is_closeable) : ?>
  <div class="user-alert-close">
    <a href="javascript:;" rel="<?php print $nid; ?>">x</a>
  </div>
  <?php endif; ?>

  <div class="user-alert-message row user-alert-level<?php print $node->field_alert_level[LANGUAGE_NONE][0]['value']; ?>">
    <?php if ($alert_label) : ?>
    <div class="user-label col-md-2">
      <?php print $alert_label; ?>
    </div>
    <?php endif; ?>
    <div class="col-md-10">
      <?php print $body; ?>
    </div>
  </div>

</div>
