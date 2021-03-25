# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| name_first_zen  | string | null: false |
| name_family_zen | string | null: false |
| name_first_kana | string | null: false |
| birth_year      | string | null: false |
| birth_month     | string | null: false |
| birth_day       | string | null: false |


### Association

- has_many :items
- has_many :sales



## items テーブル

| Column     | Type          | Options     |
| ---------- | ------------- | ----------- |
| image      | ActiveStorage | null: false |
| item_name  | text          | null: false |
| item_text  | text          | null: false |
| category   | string        | null: false |
| status     | text          | null: false |
| burden     | text          | null: false |
| area       | string        | null: false |
| days       | string        | null: false |
| price      | string        | null: false |
| user_id    | references    |             |


### Association

- has_one :sales
- belongs_to :users



## sales テーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| card_number      | string        | null: false |
| card_limit_month | string        | null: false |
| card_limit_year  | string        | null: false |
| security_cord    | string        | null: false |
| postal_cord      | string        | null: false |
| prefectures      | string        | null: false |
| area             | string        | null: false |
| address          | text          | null: false |
| building_name    | string        | null: false |
| phone_number     | string        | null: false |
| user_id          | references    |             |



### Association

- belongs_to :users
- belongs_to :sales
