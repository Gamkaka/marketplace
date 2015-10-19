/**
 * @file
 *   Testing a demo of Drupal. The script will log in and check for various
 *   features in Drupal core. This demo was inspired by a similar script for
 *   a Wordpress site. The original script was written by Henrique Vicente.
 *
 * @see https://github.com/henvic/phantom-casper-simple-talk/blob/master/wordpress.js
 */
var config = {
  'host': 'http://gitemindhub/dev-eminhub',
  'form': {
    'name': 'admin',
    'pass': 'admin'
  }
};
 
var nodeContents = {
  'title': 'Hello, World!',
  'body[und][0][value]': 'This content was added by CasperJS!'
};
 
casper.test.begin('Testing Drupal demo site', 8, function suite(test) {
 
  casper.start(config.host, function() {
 
    casper.fill('form#user-login-form', config.form, true);
    test.comment('Logging in...');
  });
 
  casper.then(function() {
    test.assertHttpStatus(200, "Authentication successful");
    test.assertExists('body.logged-in', 'Drupal class for logged-in users was found.');
    //this.click('a[href="admin/content"]');
    //test.comment('Clicking the Content admin link...');
    phantomcss.screenshot('#content', 'a screenshot of my dialog');
  });

  casper.thenOpen(config.host + 'admin/help').waitForText('Help',
    function then() {
      this.test.assertTextExists('Help topics', 'Help topics');
      this.test.assertDoesntExist('#user-login', 'Login form not present on handbook page');
    },
    function timeout() {
      this.test.assert(false, 'Loaded Online Help for administrator.');
    }
  );
 
  casper.thenOpen(config.host + 'node/add/page').waitForText('Create Basic page',
    function then() {
      test.assertHttpStatus(200, 'Opened the node/add/page page.');
      test.assertExists('form#page-node-form', 'Found the node/add/page form.');
      casper.fill('form#page-node-form', nodeContents, true);
      test.comment('Saving new node...');
  });
 
  casper.then(function() {
    test.assertTitleMatch(new RegExp(nodeContents.title), 'Our custom title was found on the published page.');
 
    test.assertEvalEquals(function () {
      return jQuery('.node-page .content p').text();
    }, nodeContents['body[und][0][value]'], 'Our custom text was found on the published page.');
  });
 
  casper.thenOpen(config.host + 'user/logout', function() {  });
  
  casper.run(function () {
    test.done();
  });
});

