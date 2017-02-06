hide_nav_scroll = undefined

hide_nav_scroll = ->
  if $(this).scrollTop() > 50
      $('.pageNav').fadeOut()
  else
      $('.pageNav').fadeIn()
return
$(window).scroll hide_nav_scroll