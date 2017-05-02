# 大丈夫0円(仮) 

[Heroku公開予定]()

いろんな人(ボット)から「大丈夫」と言われることで根拠のない自信を持てるウェブアプリ。

## Description

「大丈夫」と励ましてほしい人の写真とセリフを考えて"カウンセラー"として登録し、自分の悩み、不安を投稿する。
そうすると登録したカウンセラーから(上で自分が考えた)温かいセリフを送ってもらえる。

***DEMO:***

![DEMO](https://github.com/adamist521/daijobu/blob/media/demo.gif)

## Requirement
* Ruby version  
  `ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin16]`

* System dependencies  
  - `rmagick(image-magick@6) (LINE風トーク画面を生成する場合)`

* Configuration

* Database creation  
  `rake db:migrate`
  
* Database initialization  
  `rake db:seed`

* How to run the test suite  
  `rails s`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions  

* Tested Environment  
  macOS Sierra


## Usage
デモGIFを参照。

1. ユーザ登録を行う
2. (カウンセラーを登録する)
3. カウンセラーを選ぶ(自分または他のユーザが登録したカウンセラー)
4. 悩みや不安を投稿する
5. カウンセラーから根拠のない自信を与えられる

## Features

- 根拠のない自信
- 癒やし


For more information, see `daijobu --help`(未実装).


## Installation

    $ git clone https://github.com/adamist521/daijobu.git

## Author

[adamist521](https://github.com/adamist521)

## License

[MIT]()

