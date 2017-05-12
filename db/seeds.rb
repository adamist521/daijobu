# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: "techcamp@tech.camp", password: "666666", password_confirmation: "666666", nickname: "星野源",
            avatar: open("http://res.cloudinary.com/dngqhhpqw/image/upload/v1494574888/22/original/gen.png"))

Counselor.create(user_id: 2, name: "新垣結衣", response: "大丈夫、なんとかなるよー",
                 avatar: open("http://res.cloudinary.com/dngqhhpqw/image/upload/v1494577636/gakki_vzn5q1.jpg"))

Counselor.create(user_id: 2, name: "トランプ", response: "大丈夫、偉大だから！",
                 avatar: open("http://res.cloudinary.com/dngqhhpqw/image/upload/v1494577635/trump_dyauog.jpg"))

Counselor.create(user_id: 2, name: "小島よしお", response: "ダイジョブダイジョブー",
                 avatar: open("http://res.cloudinary.com/dngqhhpqw/image/upload/v1494577636/kojima_vdpias.png"))

Counselor.create(user_id: 2, name: "ワンガリ・マータイ", response: "モッタイナイ。",
                 avatar: open("http://res.cloudinary.com/dngqhhpqw/image/upload/v1494577635/maathai_rtupwt.jpg"))

Counselor.create(user_id: 2, name: "てるふぃー", response: "サッカーチームのほうだよ。",
                 avatar: open("http://res.cloudinary.com/dngqhhpqw/image/upload/v1494577635/terufi_um7hak.jpg"))


Trouble.create(user_id: 2, counselor_id: 2, content: "どうしたらいいかなぁ。助けて!")
