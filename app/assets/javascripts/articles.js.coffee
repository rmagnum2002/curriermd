# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#article_author_tokens').tokenInput '/authors.json',
    theme: 'facebook'
    prePopulate: $('#article_author_tokens').data('load')

jQuery ->
  $('#article_tag_tokens').tokenInput '/tags.json',
    theme: 'facebook'
    prePopulate: $('#article_tag_tokens').data('load')
