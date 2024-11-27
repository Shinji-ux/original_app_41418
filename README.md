# README

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Associations

- has_one :user_profile
- has_many :items
- has_many :suppliers
- has_many :supplier_records, through: :suppliers
- has_many :customers
- has_many :customer_records, through: :customers

## user_profileテーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| company | string     | null: false                    |
| address | string     | null: false                    |
| phone   | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Associations

- belongs_to :user

## itemsテーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| item_name | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Associations

- belongs_to :user
- has_many :item_suppliers
- has_many :supplier_records, through: :item_suppliers
- has_many :item_customers
- has_many :customer_records, through: :item_customers

## suppliersテーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| company | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Associations

- belongs_to :user
- has_many :supplier_records

## supplier_recordsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| transaction_date | string     | null: false                    |
| total_price      | string     | null: false                    |
| supplier_id      | references | null: false, foreign_key: true |

### Associations

- belongs_to :supplier
- has_many :item_suppliers
- has_many :items, through: :item_suppliers

## item_suppliersテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| quantity           | string     | null: false                    |
| supplier_record_id | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Associations

- belongs_to :supplier_record
- belongs_to :item

## customersテーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| company | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Associations

- belongs_to :user
- has_many :customer_records

## customer_recordsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| transaction_date | string     | null: false                    |
| total_price      | string     | null: false                    |
| customer_id      | references | null: false, foreign_key: true |

### Associations

- belongs_to :customer
- has_many :item_customers
- has_many :items, through: :item_customers

## item_customersテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| quantity           | string     | null: false                    |
| customer_record_id | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Associations

- belongs_to :customer_record
- belongs_to :item
