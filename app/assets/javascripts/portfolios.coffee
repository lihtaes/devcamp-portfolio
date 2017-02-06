ready = undefined
set_positions = undefined

set_positions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return

ready = ->
  alert("It's working")
  set_positions()
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    set_positions()
    $('.card').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax
      type: 'PUT'
      url: '/portfolios/sort' 
      data: order: updated_order
    return
  return


$(document).ready ready

hide_nav_scroll = undefined

hide_nav_scroll = ->
  if $(this).scrollTop() > 50
      $('.pageNav').fadeOut()
  else
      $('.pageNav').fadeIn()

$(window).scroll hide_nav_scroll  