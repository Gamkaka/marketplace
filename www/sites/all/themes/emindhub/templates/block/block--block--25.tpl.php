<?php global $base_url; ?>

<section id="<?php print $block_html_id; ?>" class="emh-module how-it-works hiw container <?php print $classes; ?> clearfix"<?php print $attributes; ?>>
  <?php print render($title_prefix); ?>
  <?php if ($title): ?>
    <div class="emh-title">
      <?php print t('CHANGEME Comment ça marche ?'); ?>
    </div>
  <?php endif;?>
  <?php print render($title_suffix); ?>
  <div class="emh-subtitle">
    <?php print t('CHANGEME C\'est simple, gratuit et en 3 étapes'); ?>
  </div>

  <ul class="hiw-tabs">
    <li><button type="button" name="button" data-tab="hiw-customer" class="hiw-tab emh-button customer"><?php print t('You need expertise'); ?></button></li>
    <li><button type="button" name="button" data-tab="hiw-expert" class="hiw-tab emh-button expert"><?php print t('You have expertise'); ?></button></li>
  </ul>

  <!-- CUSTOMER-->
  <div class="hiw-tab-content hiw-customer">

    <div class="hiw-step hiw-step-1">

      <div class="hiw-step-title">
        <strong>1</strong> - <?php print t('CHANGEME Je choisis un type de service et une communauté d\'experts'); ?>
      </div>

      <ul class="hiw-services">
        <li class="hiw-service">
          <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/ico-faq.svg" alt="" />
          <div class="label">FAQ</div>
          <div class="legend"><?php print t('Consult a list of questions and answers to recurring and common themes'); ?></div>
        </li>
        <li class="hiw-service">
          <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/ico-doc.svg" alt="" />
          <div class="label">Doc</div>
          <div class="legend"><?php print t('Request a community of experts to find a specific document'); ?></div>
        </li>
        <li class="hiw-service">
          <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/ico-qa.svg" alt="" />
          <div class="label">Q/A</div>
          <div class="legend"><?php print t('Ask a question to a community of experts'); ?></div>
        </li>
        <li class="hiw-service">
          <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/ico-call.svg" alt="" />
          <div class="label">Call</div>
          <div class="legend"><?php print t('Request a telephone appointment with an expert'); ?></div>
        </li>
        <li class="hiw-service">
          <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/ico-survey.svg" alt="" />
          <div class="label">Survey</div>
          <div class="legend"><?php print t('Put out a survey to a community of experts'); ?></div>
        </li>
        <li class="hiw-service">
          <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/ico-missions.svg" alt="" />
          <div class="label">Missions</div>
          <div class="legend"><?php print t('Search for an expert for a mission or project'); ?></div>
        </li>
        <li class="hiw-service">
          <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/ico-cv.svg" alt="" />
          <div class="label">CV</div>
          <div class="legend"><?php print t('Call on a community of experts to find qualified candidates for recruitment'); ?></div>
        </li>
      </ul>
    </div>

    <div class="hiw-steps-group">

      <div class="hiw-step hiw-step-2">
        <div class="hiw-step-title">
          <strong>2</strong> - <?php print t('CHANGEME Je consulte les réponses à mon besoin'); ?>
        </div>

        <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/responses.svg" alt="" />
      </div>

      <div class="hiw-step hiw-step-3">
        <div class="hiw-step-title">
          <strong>3</strong> - <?php print t('CHANGEME J\'accède au profil des experts et j\'achète leur contenu'); ?>
        </div>

        <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/community.svg" alt="" />
      </div>

    </div>

    <div class="emh-actions">

      <div class="emh-action">
        <a class="emh-button solid" href="#"><?php print t('CHANGEME Poster une demande'); ?></a>
      </div>

    </div>


  </div>


  <!-- EXPERT-->
  <div class="hiw-tab-content hiw-expert">
    <div class="hiw-steps">
      <div class="hiw-step hiw-step-1">
        <div class="hiw-step-title">
          <?php print t('CHANGEME Je consulte les demandes publiques ou liées à ma communauté'); ?>
        </div>

        <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/requests.svg" alt="" />
      </div>

      <div class="hiw-steps-group">

        <div class="hiw-step hiw-step-2 arrowed">
          <div class="hiw-step-title">
            <?php print t('CHANGEME Je réponds à une demande'); ?>
          </div>

          <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/responses-exp.svg" alt="" />
        </div>

        <div class="hiw-step hiw-step-3 arrowed">
          <div class="hiw-step-title">
            <?php print t('CHANGEME Je parraine un expert'); ?>
          </div>

          <img class="hiw-step-picture" src="<?php print $base_url . '/' . drupal_get_path('theme', 'emindhub'); ?>/images/sponsorship.svg" alt="" />
        </div>

      </div>

      <div class="hiw-step hiw-step-4 arrowed">
        <dl class="hiw-step-title">
          <dt><strong>1</strong> - <?php print t('CHANGEME Je développe ma notoriété'); ?></dt>
          <dt><strong>2</strong> - <?php print t('CHANGEME J\'optiens de nouvelles missions'); ?></dt>
          <dt><strong>2</strong> - <?php print t('CHANGEME Je gagne des crédits lorsque :'); ?></dt>
          <dd><?php print t('CHANGEME mon profil est consulté'); ?></dd>
          <dd><?php print t('CHANGEME mes parrainages sont acceptés'); ?></dd>
        </dl>

      </div>
    </div>

    <div class="emh-actions">

      <div class="emh-action">
        <a class="emh-button solid" href="#"><?php print t('CHANGEME Poster une demande'); ?></a>
      </div>

    </div>

  </div>

  <script type="text/javascript">
    Drupal.behaviors.offCanvasMenu = {
      attach: function (context, settings) {
        jQuery('.hiw-tabs', context).once().on('click', 'button', function (e) {
          var $this = jQuery(this);
          jQuery('.' + $this.data('tab')).removeClass('hiw-hidden').siblings('.hiw-tab-content').addClass('hiw-hidden');
          jQuery('.hiw-tabs .active').removeClass('active');
          $this.addClass('active');
        });

        jQuery('.hiw-tabs', context).find('button').first().trigger('click');
      }
    };
  </script>

</section>
