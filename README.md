# テーブル設計

## usersテーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| nickname            | string    | null: false |
| email               | string    | null: false |
| encrypted_password  | string    | null: false |
| last_name           | string    | null: false |
| first_name          | string    | null: false |
| last_name_kana      | string    | null: false |
| first_name_kana     | string    | null: false |
| birthday            | date      | null: false |

### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| title               | string       | null: false                    |
| instruction         | text         | null: false                    |
| category            | string       | null: false                    |
| status              | string       | null: false                    |
| shipping_fee        | string       | null: false                    |
| shipping_area       | string       | null: false                    |
| days_to_ship        | string       | null: false                    |
| price               | integer      | null: false                    |
| user                | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record


## purchase_recordsテーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| user                | references   | null: false, foreign_key: true |
| item                | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address



## shipping_addressesテーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| postal_code         | string       | null: false                    |
| prefecture          | string       | null: false                    |
| city                | string       | null: false                    |
| address             | string       | null: false                    |
| building_name       | string       |                                |
| phone_number        | string       | null: false                    |
| purchase_record     | references   | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record


