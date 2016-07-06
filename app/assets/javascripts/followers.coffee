$ ->

  $(".flwng").on "click", (event) ->
    event.preventDefault()
    $(".follower-id").fadeToggle()

  $(".flw").on "click", (event) ->
    event.preventDefault()
    $(".following-id").fadeToggle()

  $(".post_counter").on "click", (event) ->
    event.preventDefault()
    $(".user-posts").fadeToggle()