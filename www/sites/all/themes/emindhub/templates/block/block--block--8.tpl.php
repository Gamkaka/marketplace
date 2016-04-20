<?php
/**
 * @file
 * Default theme implementation to display a block.
 *
 * Available variables:
 * - $block->subject: Block title.
 * - $content: Block content.
 * - $block->module: Module that generated the block.
 * - $block->delta: An ID for the block, unique within each module.
 * - $block->region: The block region embedding the current block.
 * - $classes: String of classes that can be used to style contextually through
 *   CSS. It can be manipulated through the variable $classes_array from
 *   preprocess functions. The default values can be one or more of the
 *   following:
 *   - block: The current template type, i.e., "theming hook".
 *   - block-[module]: The module generating the block. For example, the user
 *     module is responsible for handling the default user navigation block. In
 *     that case the class would be 'block-user'.
 * - $title_prefix (array): An array containing additional output populated by
 *   modules, intended to be displayed in front of the main title tag that
 *   appears in the template.
 * - $title_suffix (array): An array containing additional output populated by
 *   modules, intended to be displayed after the main title tag that appears in
 *   the template.
 *
 * Helper variables:
 * - $classes_array: Array of html class attribute values. It is flattened
 *   into a string within the variable $classes.
 * - $block_zebra: Outputs 'odd' and 'even' dependent on each block region.
 * - $zebra: Same output as $block_zebra but independent of any block region.
 * - $block_id: Counter dependent on each block region.
 * - $id: Same output as $block_id but independent of any block region.
 * - $is_front: Flags true when presented in the front page.
 * - $logged_in: Flags true when the current user is a logged-in member.
 * - $is_admin: Flags true when the current user is an administrator.
 * - $block_html_id: A valid HTML ID and guaranteed unique.
 *
 * @see bootstrap_preprocess_block()
 * @see template_preprocess()
 * @see template_preprocess_block()
 * @see bootstrap_process_block()
 * @see template_process()
 *
 * @ingroup themeable
 */
global $base_url;
$safe_link = rawurldecode($base_url . '/requests/all?type[challenge]=challenge');
$threshold = variable_get('emh_points_challenge_threshold', '1000');
?>
<section id="<?php print $block_html_id; ?>" class="<?php print $classes; ?> clearfix"<?php print $attributes; ?>>

  <?php print render($title_prefix); ?>
  <?php if ($title): ?>
    <h2<?php print $title_attributes; ?>><span><?php print $title; ?></span></h2>
  <?php endif;?>
  <?php print render($title_suffix); ?>

  <div class="content">
    <?php //print $content ?>

    <?php if (user_access('create challenge content')) : ?>
    <?php echo sprintf(t('%sChallenge%sRequest for %sservice proposals%s to innovate or solve a problem%s %s points%sCreate a challenge%s'), '<div class="type-info"><h3>', '</h3><span class="mobilize-info">', '<strong>', '</strong>', '<br><span class="badge">', $threshold, '</span></span><a class="btn btn-client" href="' . url("node/add/challenge") . '"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;&nbsp;', '</a></div>'); ?>

    <?php else : ?>
    <?php echo sprintf(t('%sChallenge%sAnswer requests for %sservice proposals%sMore challenges%s'), '<div class="type-info"><h3>', '</h3><span class="mobilize-info">', '<strong>', '</strong></span><a class="btn btn-expert" href="' . $safe_link . '">', '&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a></div>'); ?>

    <?php endif; ?>

  </span>

</section> <!-- /.block -->