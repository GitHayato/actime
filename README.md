# アプリケーション名
AcTime

# アプリケーション概要
タイムスポーツをする部活生やアスリートのためのタイム管理Webアプリ。ユーザーが立てたスレッド内でタイムを管理することができ、ストップウォッチ機能も搭載。

# URL
https://actime.herokuapp.com/

# 使用技術
- Ruby 2.6.6
- Ruby on Rails 6.0.0
- Rspec
- MySQL
- AWS
  - EC2
- Nginx
- Unicorn
- Capistrano
- Google API

# 機能一覧
- ユーザー登録、ログイン機能(Devise)
- フォロー、フォロワー機能
- スレッド作成機能
- ストップウォッチ機能(Ajax)
- メッセージ送信機能(Ajax)
- タイム外部出力機能(csv形式)

# 今後実装予定
- Google Charts APIを用いたグラフ機能


# DB設計
![Image from Gyazo](https://i.gyazo.com/9d60d038e7b2047ed64bb8ebdca34387.png)