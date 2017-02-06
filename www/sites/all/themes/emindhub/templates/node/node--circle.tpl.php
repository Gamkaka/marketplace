<?php if ($teaser) : ?>
  <?php $alias = str_replace('content/', '', drupal_get_path_alias('node/' . $node->nid)); ?>

  <div id="<?php print $alias; ?>" class="row section">

    <div class="circle-logo">
      <?php if (!empty($content['field_circle_logo'])) : ?>
        <?php print render($content['field_circle_logo']); ?>
      <?php endif; ?>
    </div>

    <div class="circle-title">
      <?php if (og_is_member('node', $node->nid, 'user', user_load($user->uid))) : ?>
        <h2<?php print $title_attributes; ?>><a href="<?php print $node_url; ?>"><?php print $title; ?></a></h2>
      <?php else : ?>
        <h2<?php print $title_attributes; ?>><?php print $title; ?></h2>
      <?php endif; ?>
      <div class="circle-count">
        <?php print format_plural(og_extras_subscriber_count($node->nid), '@count member', '@count members'); ?>
      </div>
    </div>

    <?php if (!empty($content['body'])) : ?>
      <div class="circle-body">
        <?php print render($content['body']); ?>
      </div>
    <?php endif; ?>

    <div class="circle-membership-infos">
      <?php if (module_exists('emh_circles') && !empty(emh_circles_show_membership_state_info($node, $user))) : ?>
      <span class="circle-membership-state">
        <?php print emh_circles_show_membership_state_info($node, $user); ?>
      </span>
      <?php endif; ?>

      <?php if (!empty(og_extras_subscribe('node', $node))) : ?>
      <span class="circle-membership-links">
        <?php print og_extras_subscribe('node', $node); ?>
      </span>
      <?php endif; ?>

    </div>

  </div>
<?php else: ?>
  <div id="node-<?php print $node->nid; ?>" class="<?php print $classes; ?> clearfix"<?php print $attributes; ?>>

    <div class="content"<?php print $content_attributes; ?>>

      <div class="row">
        <div class="col-sm-8">
          <?php if (!empty($content['field_circle_message'])) : ?>
            <?php print render($content['field_circle_message']); ?>
          <?php endif; ?>

          <?php
          $circle_requests_block = module_invoke('views', 'block_view', 'ebd3d59bc59a77db1ff1c0c9be295d26');
          if (!empty($circle_requests_block)) : ?>
            <section id="block-views-ebd3d59bc59a77db1ff1c0c9be295d26" class="block clearfix">
              <h2><span><?php print t('Latest requests'); ?></span></h2>
              <div class="content">
                <?php print render($circle_requests_block['content']); ?>
              </div>
            </section> <!-- /.block -->
          <?php endif; ?>
        </div>

        <div class="col-sm-4">
          <?php if (!empty($content['body']) || !empty($content['field_circle_website'])) : ?>
            <h3><?php print t('About this circle'); ?></h3>

            <?php print render($content['body']); ?>

            <?php if (!empty($content['field_circle_website'])) : ?>
              <?php print render($content['field_circle_website']); ?>
            <?php endif; ?>

            <hr />
          <?php endif; ?>

          <?php if (!empty($managers)) : ?>
          <div class="circle-managers">
            <?php print format_plural(count($manager_uids), 'Manager:', 'Managers:'); ?>
            <?php foreach ($managers as $manager): ?>
              <?php print $manager; ?>&nbsp;
            <?php endforeach; ?>
          </div>
          <?php endif; ?>

        </div>
      </div>

      <?php
        // We hide the comments and links now so that we can render them later.
        hide($content['comments']);
        hide($content['links']);
        // print render($content);
      ?>
    </div>

    <?php //print render($content['links']); ?>
    <?php //print render($content['comments']); ?>

  </div>
<?php endif; ?>
