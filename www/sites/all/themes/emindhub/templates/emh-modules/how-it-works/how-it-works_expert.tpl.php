<!-- EXPERT-->
<div class="hiw-tab-content hiw-expert">
  <div class="hiw-steps">
    <div class="hiw-step hiw-step-1">
      <div class="hiw-step-title">
        <?php print t('I review the public requests and those related to my community'); ?>
      </div>

      <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/requests.svg" alt="" />
    </div>

    <div class="hiw-steps-group">

      <div class="hiw-step hiw-step-2 arrowed">
        <div class="hiw-step-title">
          <?php print t('I respond to a request'); ?>
        </div>

        <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/responses-exp.svg" alt="" />
      </div>

      <div class="hiw-step hiw-step-3 arrowed">
        <div class="hiw-step-title">
          <?php print t('I sponsor an expert'); ?>
        </div>

        <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/sponsorship.svg" alt="" />
      </div>

    </div>

    <div class="hiw-step hiw-step-4 arrowed">
      <dl class="hiw-step-title">
        <dt><strong>1</strong> - <?php print t('I develop my reputation'); ?></dt>
        <dt><strong>2</strong> - <?php print t('I pick up new missions'); ?></dt>
        <dt><strong>2</strong> - <?php print t('I earn credit when :'); ?></dt>
        <dd><?php print t('my profile is accessed'); ?></dd>
        <dd><?php print t('my referrals are accepted'); ?></dd>
      </dl>

    </div>
  </div>

  <div class="emh-actions">

    <div class="emh-action">
      <a class="emh-button solid-alt" href="#login-connexion" data-toggle="modal" data-target="#login-connexion"><?php print t('Post a request'); ?></a>
    </div>

  </div>

  <?php if (!$block_html_id) : ?>
  <?php include_once(drupal_get_path('theme','emindhub').'/templates/emh-modules/how-it-works/how-it-works_expert_testimonials.tpl.php'); ?>
  <?php endif; ?>

  <?php if (!$block_html_id) : ?>
    <?php
    global $base_url, $language;
    $current_lang = $language->language;
    $front_theme = path_to_theme();
    $front_theme = $base_url . '/' . $front_theme;

    // Video
    if (!empty($current_lang) && $current_lang == 'fr') {
      $video_url = 'https://www.youtube.com/embed/Vi2bkPyqyCs?&amp;hl=fr&amp;cc_lang_pref=fr&amp;cc_load_policy=1';
    } else {
      $video_url = 'https://www.youtube.com/embed/VAXPojC8KLU';
    }
    ?>
    <div class="hiw-video container">
      <h3><?php print t('Learn about eMindHub on video'); ?></h3>
      <div class="embed-responsive embed-responsive-16by9">
       <iframe class="embed-responsive-item" src="<?php print $video_url; ?>"></iframe>
    </div>
    </div>
  <?php endif; ?>

  <?php if (!$block_html_id) : ?>
  <section class="emh-module faq container">

      <div class="emh-subtitle"><?php echo t('Frequently asked questions') ?></div>
      <?php
      $FAQ_expert_block = module_invoke('views', 'block_view', 'faq-block_faq_expert');
      print render($FAQ_expert_block['content']);
      ?>

      <div class="emh-actions">

        <div class="emh-action">
          <?php print t('CHANGEME Vous êtes expert en aéronautique ? Répondez aux demandes et gagnez des crédits'); ?> <a class="emh-button solid-alt" href="#login-connexion" data-toggle="modal" data-target="#login-connexion"><?php print t('CHANGEME Proposer une expertise'); ?></a>
        </div>

      </div>

  </section>
  <?php endif; ?>

</div>
