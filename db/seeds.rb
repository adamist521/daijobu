# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: "techcamp@tech.camp", password: "666666", password_confirmation: "666666", nickname: "星野源",
            avatar: File.open(File.join(Rails.root,'app/assets/images/others/gen.png')))

Counselor.create(user_id: 1, name: "新垣結衣", response: "大丈夫、なんとかなるよー",
                 avatar: File.open(File.join(Rails.root,'app/assets/images/others/gakki.jpg')))

Trouble.create(user_id: 1, counselor_id: 1, content: "どうしたらいいかなぁ。助けて!")
