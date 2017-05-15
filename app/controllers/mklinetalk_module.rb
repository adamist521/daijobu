# coding: utf-8
module MkLineTalk
  def mkimage(trouble)
    # img = Magick::ImageList.new(asset_path("line_bg.jpg")) # 元画像の sample.jpg を読み込み
    # img = Magick::ImageList.new(Rails.root.join('app/assets/images/others',"line_bg.jpg")) # 元画像の sample.jpg を読み込み
    img = Magick::Image.read("http://res.cloudinary.com/dngqhhpqw/image/upload/v1494837301/line_bg_ojgogs.jpg")[0]
    # scaled_img = img.scale(300, 300)
    img.alpha = Magick::ActivateAlphaChannel


    # img 360x641

    # font = 
    # font = "#{Rails.root}/lib/fonts/hiragino.ttc"
    FileUtils.cd(Rails.root.join('app/assets/fonts'))
    # fontの読み込みができない問題。 これはrubyのパスの方の問題?
    # $LOAD_PATH.unshift(File.dirname(__FILE__))
    font = "hiragino.ttc"
    

    # parameters
    # 自分の投稿関連
    cx = 80 # img.columns  # img.columns - width/2 # img.columns - width
    cy = 100
    recrad = 15
    psize = 16
    psize_name = 16
    margin_x = 10
    margin_y = 4
    line_height = psize + 2
    height = cy + line_height + margin_y * 3
    width = img.columns - 20  # 絶対座標になってる
    ballon_size = 10
    margin_kidoku = 5

    # 友達のレスポンス関連
    marginleft = 70
    fr_max = 300
    margin_talk = 30

    psize_info = 10

    t = Time.now.advance(minutes: -5)
    t_fr = Time.now

    # talk_name = "新垣結衣"
    talk_name = trouble.counselor.name
    # talk_res = "まあ大丈夫だから落ち着こ。恋ダンスでも踊ろうよ。"
    talk_res = trouble.counselor.response
    tsep_fr = ((fr_max - marginleft) / psize).floor - 1 
    res_vec = talk_res.scan(/.{1,#{tsep_fr}}/)

    # text = '終わるどうしようどうしようどうしようどうしよう、なんてこっちゃなんてこっちゃなんてこっちゃ'
    text = trouble.content
    tsep = ((width - cx) / psize).floor - 1
    textvec = text.scan(/.{1,#{tsep}}/)


    # ここから描画
    message_date = "今日"
    dr_sys = Magick::Draw.new
    dr_sys.fill = "#00000030"
    dr_sys.roundrectangle(180 - psize_info*message_date.length/2 - 8, 85 - psize_info -4,
                                                                                      180 + psize_info*message_date.length/2 + 8, 85 + 4,
                                                                                      7,7)
    dr_sys.draw(img)

    dr_sys.fill = "#ffffffd0"
    dr_sys.annotate(img, 0, 0, 180 - psize_info*message_date.length/2, 85, message_date) do
      self.font      = font
      self.fill      = 'white'
      self.stroke    = 'transparent'
      self.pointsize = psize_info
    end

    dr = Magick::Draw.new
    # トーク相手名  # 英語非対応
    dr.annotate(img, 0, 0, 180 - psize_name*talk_name.length/2, 40, talk_name) do
      self.font      = font
      self.fill      = 'white'
      self.stroke    = 'transparent'
      self.pointsize = psize_name
    end

    # トークの箱(自分)
    # dr.fill = "#85E049"  # <- 緑1
    dr.fill = "#AFEB89" # <- 緑2
    talk_height = height + line_height * textvec.length
    dr.roundrectangle(cx, cy, width, talk_height, recrad, recrad)
    dr.polygon(*[width,cy+recrad,
                 width+ballon_size,cy+recrad-2,
                 width,cy+recrad+ballon_size])
    dr.draw(img)

    # トークの文字
    # draw = Magick::Draw.new
    lastheight = 0
    textvec.each_with_index do |t, i|
      dr.annotate(img, width, 0, cx + margin_x, cy + (psize+margin_y)*(i+1) + margin_y, t) do
        self.font      = font
        self.fill      = 'black'
        self.stroke    = 'transparent'
        self.pointsize = psize
      end
    end

    # 既読、日付 (自分)
    message_time = t.to_s(:time)
    dr.annotate(img, 0, 0, cx - margin_kidoku - psize_info*3, talk_height - 5, message_time) do
      self.font      = font
      self.fill      = 'white'
      self.stroke    = 'transparent'
      self.pointsize = psize_info
    end

    dr.annotate(img, 0, 0, cx - margin_kidoku - psize_info*2, talk_height - psize_info - 9, "既読") do
      self.font      = font
      self.fill      = 'white'
      self.stroke    = 'transparent'
      self.pointsize = psize_info
    end

    # 相手のトーク(箱)
    dr_fr = Magick::Draw.new
    dr_fr.fill = "white"
    dr_fr.roundrectangle(marginleft, talk_height + margin_talk, fr_max, talk_height + margin_talk + 20 + line_height * res_vec.length, recrad, recrad)  # 魔法の30のセットアップがある。 できればマージ、パディングなどちゃんと設計する。
    dr_fr.polygon(*[marginleft,talk_height + margin_talk + recrad,
                    marginleft-ballon_size,talk_height + margin_talk + recrad - 2, 
                    marginleft,talk_height + margin_talk + recrad + ballon_size])
    dr_fr.draw(img)

    # 相手のトーク(メッセージ)
    res_vec.each_with_index do |t, i|
      dr_fr.annotate(img, width, 0, marginleft + margin_x, talk_height + margin_talk + (psize+margin_y)*(i+1) + margin_y, t) do
        self.font      = font
        self.fill      = 'black'
        self.stroke    = 'transparent'
        self.pointsize = psize
      end
    end

    # 相手のアイコン、名前
    dr_fr.annotate(img, 0, 0, marginleft-ballon_size, talk_height + 14, talk_name) do
      self.font      = font
      self.fill      = 'white'
      self.stroke    = 'transparent'
      self.pointsize = psize_info
      self.gravity   = Magick::NorthWestGravity
    end

    # icon = Magick::ImageList.new(Rails.root.join('app/assets/images/others','gakki.jpg'))
    # icon = Magick::ImageList.new(trouble.counselor.avatar.path(:thumb))
    icon = Magick::Image.read(trouble.counselor.avatar.url(:thumb))[0]
    icon_size = 40
    icon.resize_to_fill!(icon_size, icon_size)
    img.composite!(icon, 10, talk_height + 10, Magick::OverCompositeOp)
    # icon.write('tmp/gakki_resize.jpg')


    # 既読、日付
    message_time_fr = t_fr.to_s(:time)
    dr.annotate(img, 0, 0,
                fr_max+8, talk_height + margin_talk + 30 + line_height * res_vec.length - 5,
                message_time_fr) do
      self.font      = font
      self.fill      = 'white'
      self.stroke    = 'transparent'
      self.pointsize = psize_info
    end

    # dr.annotate(img, width, 0, cx + margin_x, cy + psize + margin_y, textvec[0]) do
    #   self.font      = font
    #   self.fill      = 'black'
    #   self.stroke    = 'transparent'
    #   self.pointsize = psize
    # end


    # textwidth = dr.get_type_metrics(text).width
    # textheight = dr.get_type_metrics(text).height
    # p textwidth
    # p textheight

    # img.write("moji.png") # save to file
    return img.to_blob
  end

  # fontのために移動したのをもとに戻す。
  FileUtils.cd(Rails.root)
  module_function :mkimage
end
