$(document).ready(function() {
  setup_lucky_tooltip();
  setup_claim_this_account_tooltip();
  setup_bookmarklet_tooltip();
  set_focus_on_url_input();
});

function set_focus_on_url_input() {
  $('#vurl_url').focus();
}

function setup_bookmarklet_tooltip() {
  $('#bookmarklet .help').simpletip({
    content: "Drag the 'Vurlify!' link to your toolbar to vurlify any page address while you're browsing",
    fixed: false
  });
}

function setup_lucky_tooltip() {
  $('.lucky_link').simpletip({
    content: "Click to view a random vurl from the archives!",
    fixed: false
  });
}

function setup_claim_this_account_tooltip() {
  $('#claim_this_account_link').simpletip({
    content: "We've started keeping track of your vurls for you - claim your account to see the vurls you've created and how many people have viewed them",
    fixed: false
  });
}
