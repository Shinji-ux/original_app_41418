# アプリケーション名
original_app_41418

# アプリケーション概要

# URL
https://original-app-41418.onrender.com/

# テスト用アカウント

・メールアドレス：test@test.com

・パスワード：test1234

# 利用方法

# アプリケーションを作成した背景
仲卸業（小規模）の経営者から、弥生販売の使い方を教えてほしいとの相談を受けた。
「会計士から弥生販売を勧められ購入したものの、使い方が複雑すぎてわからない」とのこと。
その時点で取引履歴は全て紙の伝票に記録しており、取引の都度作成する手書き伝票、またその集計に大変な手間がかかっているという問題があった。
しかしいざ弥生販売を開いてみると、複雑すぎる機能や入力項目の多さなどから、かえって大変なのではないかと思ってしまっていた。



# 実装した機能についての画像やGIF、およびその説明

# 実装予定の機能

# データベース設計

![ER図](https://github.com/user-attachments/assets/67764238-9e13-43b5-8940-65b7ddc4d5fd)

# 画面遷移図

![flow](https://github.com/user-attachments/assets/323e2e71-46fd-41bd-9d55-037ea4c9f95f)

# 開発環境

# ローカルでの動作方法

# 工夫したポイント

# 改善点

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
