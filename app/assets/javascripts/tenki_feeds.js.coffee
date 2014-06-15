# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change',  '#tenki_feed_prefecture_id',  ->
  $.ajax(
    type: 'GET'
    url: '/tenki_feeds/cities_select'
    data: {
      prefecture_id: $(this).val()
    }
  ).done (data) ->
    $('#tenki_feed_city_id').html(data)
