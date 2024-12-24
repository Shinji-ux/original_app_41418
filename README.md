# アプリケーション名
original_app_41418

# アプリケーション概要

# URL
https://original-app-41418.onrender.com/

# テスト用アカウント

・メールアドレス：test@test.com

・パスワード：test1234

# 利用方法

## 取引先や商品の登録
画面左側の「新規登録」メニューから、登録したい項目を選択。
必須項目を入力し、登録ボタンを押下。  
仕入れ先・得意先の登録は、登録ページ内のラジオボタンで「CSVで登録」を選択することで、CSVファイルからの一括登録が可能。  
また商品はカテゴリに紐づける必要があるため、商品登録の前に、商品を紐づけるカテゴリを作成する。

## 取引情報の作成
画面右側の「発注書作成」または「納品書作成」から作成する。  

【発注書作成の場合の例】  
「発注書作成」を押すと、仕入れ先一覧が表示されるので、仕入れ先名の右側の「発注書を作成する」を押す。  
カレンダーから納品日を選択、プルダウンメニューでカテゴリと商品を選択し数量を入力する。
複数の商品を発注する場合は、「商品を追加」ボタンで商品数を増やすことができる。
全て入力を終えたら最後に「作成」ボタンを押して作成完了。  

金額の入力について  
「発注」には金額を入力する項目はない。納品書を受取後、「発注履歴」 → 「編集」で金額入力ができる。  
また「納品」には商品と数量を選択すると自動的に金額が出るが、状況に応じて手動で金額の調整が可能。

## 取引記録の集計
画面左側の「集計」メニューから、集計したい項目を選択。
プルダウンメニューで集計対象を選択。カレンダーで集計開始日と終了日を指定し検索を押すことで、条件に合致するものの一覧が表示される。  
※「カテゴリ別」 「商品別」の集計は、ラジオボタンで「仕入れ」or「販売」を選択する必要あり。

## 帳票の印刷

### 取引の都度の帳票
画面右側の「発注履歴」または「納品履歴」を選択すると取引の一覧が表示される。該当の取引の右側にある「印刷」ボタンを押すとPDF画面が表示されるので、必要に応じてダウンロード・印刷を行う。

### 月単位などの帳票
画面右側の「支払い明細書作成」または「請求書作成」を選択。
遷移先の画面に表示された項目を入力し「作成」ボタンを押すとPDF画面が表示されるので、必要に応じてダウンロード・印刷を行う。

# アプリケーションを作成した背景
仲卸業（小規模）の経営者から、弥生販売の使い方を教えてほしいとの相談を受けました。
その時点で取引履歴は全て紙の伝票に記録しており、取引の都度作成する手書き伝票、またその集計に大変な手間がかかっているという問題があった。
会計士に相談したところ、弥生販売を勧められ購入したとのことだが、使い方がわからなく全く手をつけられていないという状況だった。  
実際に私も導入を手伝ったところ、入力しなければならない情報量の多さや、求めている機能に対して機能が多すぎることなど、パソコン操作が苦手な方にはハードルが高いと感じた。  
そこで必要な機能のみに絞り、誰でもシンプルな操作で伝票の作成・集計ができるよう、このアプリケーションを作成した。

# 実装した機能についての画像やGIF、およびその説明

### 取引先の登録（CSVファイルからの一括登録）
![b129935e55517c0580a755ae3aa257ca](https://github.com/user-attachments/assets/4f9fcad4-af88-474e-b255-634297f32e66)

### 納品書の作成
![kuku](https://github.com/user-attachments/assets/14ca2c19-a79a-462e-aae4-edf5ae06b5ac)

### カテゴリ別集計
![kuku2](https://github.com/user-attachments/assets/9e437e85-ba7c-449c-85c8-d52bf6c7dfca)

### 帳票印刷
![kuku1](https://github.com/user-attachments/assets/bdab35b7-9b25-4582-b3cd-dd2b1fe34da2)


# 実装予定の機能
・金額表示を3桁ごとのカンマ区切りにする。
・消費税の表示機能。


# データベース設計

![データベース設計](https://github.com/user-attachments/assets/67764238-9e13-43b5-8940-65b7ddc4d5fd)

# 画面遷移図

![画面遷移図](https://github.com/user-attachments/assets/323e2e71-46fd-41bd-9d55-037ea4c9f95f)

# 開発環境
・フロントエンド
  HTML, CSS, JavaScript
・バックエンド
  Ruby, mySQL
・インフラ
  Ruby on Rails
・テスト
  RSpec
・テキストエディタ
  Visual Studio Code

# ローカルでの動作方法
以下のコマンドを順に実行。  
% git clone https://github.com/Shinji-ux/original_app_41418.git  
% cd xxxxxxx  
% bundle install  
% rails db:create  
% rails db:migrate  

# 工夫したポイント
パソコンやスマートフォンが苦手な方でも操作で迷わないよう「1画面につき1機能」とした。
また、目的の機能にアクセスしやすいよう、URLの階層を浅く設計した。

# 改善点
・商品、取引記録をCSVから取り込めない（現状、CSVファイルへのcategory_idなどの記述を間違えると、他のユーザーのテーブルに取り込まれてしまう）





# 制作時間
約150時間

# README

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| company            | string | null: false               |
| city               | string |                           |
| address            | string |                           |
| phone              | string |                           |
| manager            | string |                           |
| bank               | string |                           |
| branch             | string |                           |
| account_type       | string |                           |
| number             | string |                           |
| name               | string |                           |

### Associations

- has_many :categories
- has_many :items, through: :categories
- has_many :suppliers
- has_many :buys, through: :suppliers
- has_many :customers
- has_many :sells, through: :customers


## categoriesテーブル

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| category | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

# Associations

- belongs_to :user
- has_many :items
- has_many :buy_items
- has_many :sell_items

## itemsテーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| item_name | string     | null: false                    |
| unit      | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| category  | references | null: false, foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :category
- has_many :sell_items
- has_many :sells, through: :sell_items
- has_many :buy_items
- has_many :buys, through: :buy_items

## suppliersテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| company      | string     | null: false                    |
| city         | string     |                                |
| address      | string     |                                |
| phone        | string     |                                |
| user         | references | null: false, foreign_key: true |
| bank         | string     |                                |
| branch       | string     |                                |
| account_type | string     |                                |
| number       | string     |                                |
| name         | string     |                                |

### Associations

- belongs_to :user
- has_many :buys

## buysテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| transaction_date | date       | null: false                    |
| total_price      | integer    |                                |
| user             | references | null: false, foreign_key: true |
| supplier         | references | null: false, foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :supplier
- has_many :buy_items
- has_many :items, through: :buy_items

## buy_itemsテーブル

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| quantity   | integer    | null: false                    |
| item_price | integer    |                                |
| buy        | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| category   | references | null: false, foreign_key: true |

### Associations

- belongs_to :buy
- belongs_to :item
- belongs_to :category

## customersテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| company      | string     | null: false                    |
| city         | string     |                                |
| address      | string     |                                |
| phone        | string     |                                |
| user         | references | null: false, foreign_key: true |
| bank         | string     |                                |
| branch       | string     |                                |
| account_type | string     |                                |
| number       | string     |                                |
| name         | string     |                                |

### Associations

- belongs_to :user
- has_many :sells

## sellsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| transaction_date | date       | null: false                    |
| total_price      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| customer         | references | null: false, foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :customer
- has_many :sell_items
- has_many :items, through: :sell_items

## sell_itemsテーブル

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| quantity   | string     | null: false                    |
| item_price | integer    | null: false                    |
| sell       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| category   | references | null: false, foreign_key: true |

### Associations

- belongs_to :sell
- belongs_to :item
- belongs_to :category
