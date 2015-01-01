# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.feed-line, .feed-entry').on 'click', (e) ->
    e.preventDefault()
    that = $(this)

    $.ajax
      dataType: "json"
      type : 'GET'
      url: "/nuggets/get_content"
      data: 
        url: that.data('href')
        nugget: that.data('nugget')
      success: (data, status) ->
        $('#post-title').html(data.title)
        $('#post-author').html("By " + data.author)
        $('#post-date').html(data.published)
        $('#post-content').html(data.content)
        $('#post-modal').foundation('reveal', 'open');
