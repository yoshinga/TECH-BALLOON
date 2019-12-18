# TECH::BALLOON
# Link
https://tech-balloon.herokuapp.com/
# Demo
https://raw.github.com/wiki/yoshinga/TECH-BALLOON.wiki/images/https://s17.aconvert.com/convert/p3r68-cdx67/nsnkn-k0ghy.gif
# Overview
このアプリケーションはプログラミングスクールの学生をターゲットにしたとてもローカルなコミュニティーツールです。
# Description
私はプログラミングスクールで学んでいるときに、理解できない箇所をメンターに聞くよりも、同じ教材を少しだけ先に進めた学生から教えてもらう方が理解しやすいと言うことに気付きました。
そこで思いついたのが学生の間のみで情報を共有する専用のアプリケーションです。
このツールを使い、難しいと感じたところを学生全員で共有することで教材のわかりにくい場所が明確になり、補強することで、限られた時間を密に学習に費やすことができると考えました。
# Function
### 投稿機能
<!-- 魅力的な機能紹介を書くべき、また簡潔にどんな機能なのかということを最初に持ってくることで印象は良くなる -->
ブログのような形式で投稿することができます。
フォームはマークダウンに対応しているのでコードをエディターの見た目で表示することができます。
また、題名などの大きさを変更したり、色付けをすることも可能です。
### コメント機能
投稿の詳細画面の下にコメント欄を作りました。
その投稿を見てどう思ったのか、また、気になったことなどをコメント欄に書き込みましょう。
### ブックマーク機能
気に入った投稿はブックマーク登録をしましょう。
ブックマークの登録、解除はトップページ、またはマイページから行うことができます。
登録したブックマークはユーザーのマイページから見ることができます。
### 検索機能
投稿のタイトルで検索かけることができます。
検索機能にインクリメンタルサーチを実装しているのでスムーズに検索をかけることができます。
### 新規登録,ログイン
facebook,googleのアカウントとemailの３パターンでログインすることができます。
また、facebook,googleのアカウントを使ったログインはワンクリックで完了します。
# DB設計
## usersテーブル
|name|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|uid|integer||
|provider|integer||
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :posts
- has_many :favorites
- has_many :posts, through: :favorites
- belongs_to :comment
- has_one :sns_credential

## commentsテーブル
|name|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|

### Association
- has_many :users
- belongs_to :post

## postsテーブル
|name|Type|Options|
|------|----|-------|
|title|string|null: false, foreign_key: true|
|content|text|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :favorites
- has_many :user, through: :favorites
- has_many :comments

## favoritesテーブル
|name|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user

## sns_credentialsテーブル
|name|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|
|user|references|null: false, null: false|

### Association
- has_one :user