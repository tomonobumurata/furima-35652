[![Image from Gyazo](https://i.gyazo.com/b00676b0ada17097946e5dfc6ef1011c.jpg)](https://gyazo.com/b00676b0ada17097946e5dfc6ef1011c)

# アプリケーション名
furima-35652

# アプリケーション概要
フリーマーケットのアプリケーションを作成しました。ユーザー登録機能・商品出品機能・商品購入機能などがあり、自身の商品の削除または編集、他のユーザーの商品をクレジットカードを用いて購入することができます。

# URL
https://furima-35652.herokuapp.com

# Githubリポジトリ
https://github.com/tomonobumurata/furima-35652
# テスト用アカウント等
* ID/Pass
  * ID: furima
  * Pass: 0000
* テスト用アカウント
  * 購入者用
    * メールアドレス: test@test.com
    * パスワード: test12
    * 購入用カード情報
    * 番号：4242424242424242（16桁）
    * 期限：5月/25年 (未来の年月であれば可能)
    * セキュリティコード：123
* 出品者用
  * メールアドレス名: furima@test.com
  * パスワード: test12

# 開発環境
* Ruby 2.6.5
* Ruby on Rails 6.0.4
* MySQL 5.6.51
* Github
* AWS
* Visual Studio Code


# 動作確認方法
* WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。  
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。  
* 接続先およびログイン情報については、上記の通りです。
* 同時に複数の方がログインしている場合に、ログインできない可能性があります。  
* テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
* 確認後、ログアウト処理をお願いします。

# 実装機能
## 1. ユーザー登録機能
ユーザー登録をすることによって商品の出品や購入ができるようになります。（ユーザー登録をしていなくても、出品されている商品やその詳細を見ることは可能です。）
[![Image from Gyazo](https://i.gyazo.com/7b1cd8115cfa70f6faefeb6976360441.gif)](https://gyazo.com/7b1cd8115cfa70f6faefeb6976360441)

## 2. 商品一覧表示機能
現在出品されている商品を一覧で見ることができます。商品をクリックすると、商品詳細ページへ遷移します。
[![Image from Gyazo](https://i.gyazo.com/ea2aa71b82a9ffa9add34b483f7d85f9.jpg)](https://gyazo.com/ea2aa71b82a9ffa9add34b483f7d85f9)

## 3. 商品出品機能
ログイン状態の場合のみ商品画像や商品情報を入力すると、商品を出品することができます。
[![Image from Gyazo](https://i.gyazo.com/8ed4477c4ad05646c1c75e15e078c720.gif)](https://gyazo.com/8ed4477c4ad05646c1c75e15e078c720)

## 4. 商品詳細表示機能
一覧表示されている商品をクリックすると、商品詳細表示ページへ遷移します。
ログイン状態の有無、自身の商品かどうか、購入済みかどうかで、編集・削除・購入ボタンの表示を変えています。
[![Image from Gyazo](https://i.gyazo.com/55fc37b90e4d79673dd7c20a28f36cc4.gif)](https://gyazo.com/55fc37b90e4d79673dd7c20a28f36cc4)

## 5. 商品編集機能
ログイン状態で自身の商品かつ購入済みでない場合のみ、商品編集をすることができます。
[![Image from Gyazo](https://i.gyazo.com/bc6eac42926500c18aab56593e598c92.gif)](https://gyazo.com/bc6eac42926500c18aab56593e598c92)

## 6. 商品削除機能
ログイン状態で自身の商品かつ購入済みでない場合のみ、商品を削除することができます。
[![Image from Gyazo](https://i.gyazo.com/f493c8b15e7874159b9f5d56cd39fb4f.gif)](https://gyazo.com/f493c8b15e7874159b9f5d56cd39fb4f)

## 7. 商品購入機能
ログイン状態で自身の商品でない、かつ購入済みでない場合のみ商品を購入することができます。<br>また、クレジットカード情報と住所を入力する必要があります。
（クレジットカード情報は上記の「購入用カード情報」をご確認ください。）
<br>商品を購入すると、sold outの文字が商品に表示されます。
[![Image from Gyazo](https://i.gyazo.com/c10a0f4f91ee6498ff1cb4a14c0a19ef.gif)](https://gyazo.com/c10a0f4f91ee6498ff1cb4a14c0a19ef)
[![Image from Gyazo](https://i.gyazo.com/de1e5c758c5d808da649cdf0e1dbde6a.jpg)](https://gyazo.com/de1e5c758c5d808da649cdf0e1dbde6a)

# DB設計
[![Image from Gyazo](https://i.gyazo.com/eeabb382436a6cbe7548e23436c2374c.png)](https://gyazo.com/eeabb382436a6cbe7548e23436c2374c)
# テーブル設計

## usersテーブル

| Column              | Type      | Options                   |
| ------------------- | --------- | ------------------------- |
| nickname            | string    | null: false               |
| email               | string    | null: false, unique: true |
| encrypted_password  | string    | null: false               |
| last_name           | string    | null: false               |
| first_name          | string    | null: false               |
| last_name_kana      | string    | null: false               |
| first_name_kana     | string    | null: false               |
| birthday            | date      | null: false               |

### Association
- has_many :items
- has_many :records


## itemsテーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| title               | string       | null: false                    |
| instruction         | text         | null: false                    |
| category_id         | integer      | null: false                    |
| status_id           | integer      | null: false                    |
| shipping_fee_id     | integer      | null: false                    |
| prefecture_id       | integer      | null: false                    |
| days_to_ship_id     | integer      | null: false                    |
| price               | integer      | null: false                    |
| user                | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :record


## recordsテーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| user                | references   | null: false, foreign_key: true |
| item                | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addressesテーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| postal_code         | string       | null: false                    |
| prefecture_id       | integer      | null: false                    |
| city                | string       | null: false                    |
| house_number        | string       | null: false                    |
| building_name       | string       |                                |
| phone_number        | string       | null: false                    |
| record              | references   | null: false, foreign_key: true |

### Association
- belongs_to :record


