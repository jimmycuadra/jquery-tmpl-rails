//= require jquery
//= require jquery-tmpl
//= require_tree ./templates

$(function () {
  $.tmpl("templates/test", { test: "Jimmy" }).appendTo("body");
});
