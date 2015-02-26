<?php if ($block->subject): ?>
    <div class="row paddingUD">
        <div class="col-md-8 light-blue-text bold">
            <h2<?php print $title_attributes; ?>><?php print $block->subject ?></h2>
        </div>
        <div class="col-md-3"><hr class="hr-light"></div>
        <div class="col-md-1">
            <img src="<?php print url(imagePath('fluxIcon.png')); ?>">
        </div>
    </div>
<?php endif;?>
<?php if ($content): ?>
    <?php print $content; ?>
<?php endif;?>