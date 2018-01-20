<?php

/**
 * @file
 * EMH homepage page.tpl.php override.
 *
 * Please change it the less possible from the global page.tpl.php.
 */

global $base_url; ?>
  <nav id="main-nav" class="navbar navbar-emh">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only"><?php print t('Toggle navigation'); ?></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

        <a class="navbar-brand" href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>">
          <?php if ($logged_in): ?>
            <?php if (!empty($jail_circle_logo)): ?>
              <img src="<?php print $jail_circle_logo; ?>" alt="<?php print $site_name; ?>" />
            <?php else: ?>
              <img src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/logo/circles.svg" alt="<?php print $site_name; ?>" width="35" height="25" />
            <?php endif; ?>
          <?php else: ?>
            <img src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/logo/logo-h-blue.svg" alt="<?php print $site_name; ?>" width="158" height="22" />
          <?php endif; ?>
        </a>
      </div>

      <?php if (!empty($page['burgermenu'])): ?>
        <div class="burger-menu-btn-container" onclick="onClickBurgerMenuBtn();">
          <button type="button" class="btn btn-default emh-blue">
            <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
          </button>
        </div>
      <?php endif; ?>

      <?php if (!empty($page['topmenu']) || !empty($page['navigation'])): ?>
        <div id="navbar" class="navbar-collapse collapse">
          <?php print render($page['topmenu']); ?>
          <?php print render($page['navigation']); ?>
        </div>
      <?php endif; ?>

    </div>
  </nav>

  <?php if (!empty($page['header'])): ?>
  <header role="banner" id="page-header">
    <div class="container-fluid">

      <div class="row">
        <?php print render($page['header']); ?>
      </div>

    </div>
  </header>
  <?php endif; ?>

  <div class="main-container container-fluid">

      <?php if (!empty($page['top'])): ?>
        <div class="container-fluid">
          <?php print render($page['top']); ?>
        </div>
      <?php endif; ?>

      <div class="row nomargin">
      <div class="container-fluid">

        <?php if (!empty($page['highlighted'])): ?>
        <div class="highlighted jumbotron">
            <?php print render($page['highlighted']); ?>
        </div>
        <?php endif; ?>

        <div class="row nomargin">

          <?php if (!empty($page['sidebar_first'])) : ?>
          <?php if ($is_front) : ?>
          <aside id="sidebar-first" class="col-md-5 col-md-offset-1" role="complementary">
          <?php else : ?>
          <aside id="sidebar-first" class="col-md-2" role="complementary">
          <?php endif; ?>
            <?php print render($page['sidebar_first']); ?>
          </aside>
          <?php endif; ?>

          <section id="maincol"<?php print $content_column_class; ?>>

            <?php if (!empty($action_links)): ?>
              <ul class="action-links"><?php print render($action_links); ?></ul>
            <?php endif; ?>

            <?php print render($page['content']); ?>

          </section>

          <?php if (!empty($page['sidebar_second']) || !empty($page['help'])): ?>
          <?php if ($is_front) : ?>
          <aside id="sidebar-second" class="col-md-5" role="complementary">
          <?php else : ?>
          <aside id="sidebar-second" class="col-md-3" role="complementary">
          <?php endif; ?>
            <?php if (!empty($page['help'])): ?>
              <?php print render($page['help']); ?>
            <?php endif; ?>
            <?php print render($page['sidebar_second']); ?>
          </aside>
          <?php endif; ?>

        </div>

      </div>
      </div>

      <?php if (!empty($page['bottom']) || !empty($page['bottom_right'])): ?>
      <div class="container">
        <div class="bottom row">

          <?php if (!empty($page['bottom']) && !empty($page['bottom_right'])): ?>
          <div class="row">
            <?php print render($page['bottom']); ?>
            <?php print render($page['bottom_right']); ?>
          </div>
          <?php endif; ?>

          <?php if ((!empty($page['bottom']) && empty($page['bottom_right'])) || (empty($page['bottom']) && !empty($page['bottom_right']))): ?>
            <?php print render($page['bottom']); ?>
            <?php print render($page['bottom_right']); ?>
          <?php endif; ?>

        </div>
      </div>
      <?php endif; ?>

  </div>

  <?php print render($page['burgermenu']); ?>

  <footer class="footer">
    <div class="container">
      <div class="row">
        <div class="footer-logo">
          <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>">
            <img src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/logo/logo-h-white.svg" alt="<?php print $site_name; ?>" />
            <span><?php print t('The smart professional network <br />in aerospace'); ?></span>
          </a>
        </div>
        <div class="footer-nav">
          <?php print render($page['footer_top']); ?>
        </div>
        <div class="footer-contact">
          <h4><?php print t('Contact us'); ?></h4>
          <p><a href="<?php print url('contact'); ?>">contact@emindhub.com</a></p>
        </div>
        <div class="footer-social">
          <div class="social-links">
            <a class="social-network" href="https://twitter.com/emindhub"><img src="<?php print $base_url . '/' . drupal_get_path('module', 'emh_service_links'); ?>/images/twitter.svg" alt="Twitter" /></a>
            <a class="social-network" href="https://www.linkedin.com/company/emindhub"><img src="<?php print $base_url . '/' . drupal_get_path('module', 'emh_service_links'); ?>/images/linkedin.svg" alt="Linkedin" /></a>
          </div>
        </div>
      </div>
      <hr />
      <p class="footer-credits"><?php print date('Y'); ?> <?php print $site_name; ?> | <?php print t('All rights reserved'); ?></p>
    </div>
  </footer>

<?php print render($page['footer_bottom']); ?>
