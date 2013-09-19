$(document).on('ajax:success', '#new_ticket_comment', (event, data, status, xhr) ->
  if data['comment']
    $('#ticket-comments').prepend(data['comment'])
    $('#comment-message').val('').attr('style', '')

).bind "ajax:error", (e, xhr, status, error) ->
  console.log 'error'