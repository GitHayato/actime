# アプリケーション名
AcTime（ = Activity + Time ）　　
(アクタイム)

# アプリケーション概要
タイムスポーツをする部活生やアスリートのためのタイム管理Webアプリ。ユーザーが立てたスレッド内でタイムを管理することができ、ストップウォッチ機能も搭載。

# 背景
私自身がタイムスポーツをしており、タイム管理の杜撰さに嫌気が差していた。

# 熱意を入れた点
ストップウォッチ機能。このアプリの根幹とも言える機能なので、技術面、精神面ともに妥協せず実装した。

# 難しかった点
ストップウォッチ機能。ストップウォッチのDB保存に関する記事やGitHubがなかったため、かなりの時間を要した。

# URL
https://actime.herokuapp.com/  
http://actime.app （EC2サーバーのエラー解決中）

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
- 未実装のテストコード
- 非同期処理のリファクタリング
- 404ページの作成
- モダンフロントエンドへの切り替え

# DB設計
![Image from Gyazo](https://i.gyazo.com/9d60d038e7b2047ed64bb8ebdca34387.png)
