# README


## users テーブル

| Column           | Type         | Options                 |
|------------------|--------------|-------------------------|
| nickname         | string       | null: false             |
| email            | string       | null: false             |
| password         | string       | null: false             |
| family_name      | string       | null: false             |
| first_name       | string       | null: false             |
| family_name_kana | string       | null: false             |
| first_name_kana  | string       | null: false             |
| birth_day        | date         | null: false             |

### Association

* has_many :items
* has_many :purchases


## items テーブル

| Column           | Type         | Options                        |
|------------------|--------------|--------------------------------|
| seller           | string       | null: false, foreign_key: true |
| name             | string       | null: false                    |
| price            | integer      | null: false                    |
| category_id      | integer      | null: false                    |
| condition_id     | integer      | null: false                    |
| postage_id       | integer      | null: false                    |
| region_id        | integer      | null: false                    |
| shipping_date_id | integer      | null: false                    |

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column           | Type         | Options                        |
|------------------|--------------|--------------------------------|
| item             | references   | null: false, foreign_key: true |
| buyer            | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column           | Type         | Options                        |
|------------------|--------------|--------------------------------|
| post_code        | string       | null: false                    |
| prefecture_id    | integer      | null: false                    |
| city             | string       | null: false                    |
| block_number     | string       | null: false                    |
| building_name    | string       |                                |
| phone_number     | string       | null: false                    |
| user             | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase




