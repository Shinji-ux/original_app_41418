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

## profilesテーブル

| Column         | Type   | Options     |
|----------------|--------|-------------|



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
