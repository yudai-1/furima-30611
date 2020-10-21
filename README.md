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
| birth_day        | string       | null: false             |

### Association

* has_many :items
* has_many :purchases


## items テーブル

| Column           | Type         | Options                 |
|------------------|--------------|-------------------------|
| seller           | string       | null: false             |
| name             | string       | null: false             |
| price            | integer      | null: false             |
| image            | string       | null: false             |
| category         | string       | null: false             |
| condition        | string       | null: false             |
| postage          | string       | null: false             |
| region           | string       | null: false             |
| shipping_date    | string       | null: false             |

### Association

- has_many :users
- has_one  :purchase


## purchases テーブル

| Column           | Type         | Options                 |
|------------------|--------------|-------------------------|
| item             | string       | null: false             |
| buyer            | string       | null: false             |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column           | Type         | Options                 |
|------------------|--------------|-------------------------|
| post_code        | string       | null: false             |
| prefecture       | string       | null: false             |
| city             | string       | null: false             |
| block_number     | string       | null: false             |
| building_name    | string       |                         |
| phone_number     | string       | null: false             |

### Association

- belongs_to :purchase




