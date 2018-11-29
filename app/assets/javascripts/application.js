//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$('#myTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
