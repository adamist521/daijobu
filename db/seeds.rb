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

Counselor.create(user_id: 1, name: "新垣結衣", response: "大丈夫、なんとかなるよー",
                 avatar: open("http://res.cloudinary.com/dngqhhpqw/image/upload/v1494575000/23/original/gakki.jpg"))

Trouble.create(user_id: 1, counselor_id: 1, content: "どうしたらいいかなぁ。助けて!")
