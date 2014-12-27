$ ->
  $('.clickable').on 'click', (e) ->
    window.location.href = $(this).data('href')