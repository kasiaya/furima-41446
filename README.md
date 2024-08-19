# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_one  :profiles
- has_many :items
- has_many :orders
- has_many :delivery_addresses


## profiles テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | string | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_name          | string     | null: false |
| item_description   | text       | null: false |
| price              | string     | null: false |
| status             | text       | null: false |
| image              | text       | null: false |
| user               | references | null: false, foreign_key: true |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| delivery_payer_id  | integer    | null: false |
| delivery_area_id   | integer    | null: false |
| lead_time_id       | integer    | null: false |

### Association

- belongs_to :users
- has_one : orders


## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| delivery_address   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one : delivery_addresses


## delivery_addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| prefecture         | string     | null: false |
| city               | string     | null: false |
| building           | string     | null: false |
| building_name      | string     | null: false |
| phone_number       | string     | null: false |
| user               | references | null: false, foreign_key: true |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders
