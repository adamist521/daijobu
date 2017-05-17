# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # 文字が入力された時
  $('#search').keyup ->
    # ajaxリクエストを送信
    $.ajax
      url: 'counselors/search'        # 送信先
      type: 'GET'                # 送信するリクエスト
      data: word: $(this).val()  # 送信するデータ（パラメータ)。今回の場合は、params[:word] = “入力されている文字列” となる。
    return
  return

$ ->
  $(document).snowfall
    # image: 'http://res.cloudinary.com/dngqhhpqw/image/upload/v1494932680/flake_fu1ysz.png' # jquery-snowfall/examples/images/flake.png
    image: 'http://res.cloudinary.com/dngqhhpqw/image/upload/v1494932862/sakura_lgnnq4.png'
    minSize: 10
    maxSize: 20
