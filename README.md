# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | string | null: false |

### Association
has_many :items
has_many :purchases

# テーブル設計

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| explanation        | text   | null: false |
| category           | string | null: false |
| delivery           | string | null: false |
| region             | string | null: false |
| number_of_day      | string | null: false |
| price              | string | null: false |
| seller_user        | references | null: false, foreign_key: true |
| sold               | string | null: false |


### Association
belongs_to :seller_user
has_one: purchase


## purchases テーブル


| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| buyer_user   | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| buyer_address| references | null: false, foreign_key: true |


### Association
belongs_to :buyer_user
belongs_to :item
has_one: buyer_address


## address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postcode           | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| street             | string | null: false |
| building           | string | null: true  |
| phone_number       | string | null: false |
### Association
belongs_to :purchase

