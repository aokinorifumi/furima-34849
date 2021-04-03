# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| name_first_zen      | string | null: false               |
| name_family_zen     | string | null: false               |
| name_first_kana     | string | null: false               |
| name_family_kana    | string | null: false               |
| birth               | date   | null: false               |


### Association

- has_many :items
- has_many :sales



## items テーブル

| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| name            | string        | null: false                    |
| text            | text          | null: false                    |
| category_id     | integer       | null: false                    |
| status_id       | integer       | null: false                    |
| burden_id       | integer       | null: false                    |
| prefecture_id   | integer       | null: false                    |
| delivery_id     | integer       | null: false                    |
| price           | integer       | null: false                    |
| user            | references    | null: false, foreign_key: true |


### Association

- has_one :sale
- belongs_to :user



## streets テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| postal_cord      | string        | null: false                    |
| prefecture_id    | integer       | null: false                    |
| area             | string        | null: false                    |
| address          | string        | null: false                    |
| building_name    | string        |                                |
| phone_number     | string        | null: false                    |
| sale             | references    | null: false, foreign_key: true |


### Association

- belongs_to :sale


　
## sales テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- has_one :street
- belongs_to :user
- belongs_to :item

