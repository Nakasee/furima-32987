## users テーブル

| Column            | Type      | Options     |
| ----------------- | --------- | ------------|
| nickname          | string    | null: false |
| email             | string    | null: false |
| password          | string    | null: false |
| family_name       | string    | null: false |
| first_name        | string    | null: false |
| family_name_kana  | string    | null: false |
| first_name_kana   | string    | null: false |
| birthday          | datetime  | null: false |


### Association

- has_many :items
- has_many :comments through: :items
- has_one : byers
- has_one : cards


## items テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ------------------|
| name           | string     | null: false       |
| image          | text       | null: false       |
| price          | integer    | null: false       |
| description    | text       | null: false       |
| category_id    | integer    | null: false       |
| judgment_id    | integer    | null: false       |
| cost_id        | integer    | null: false       |
| prefecture_id  | integer    | null: false       |
| days_id        | integer    | null: false       |
| user_id        | references | foreign_key: true |

### Association
- has_many :comments
- belongs_to :users
- has_one : byers
- has_one : cards


## comments テーブル

| Column      | Type       | Options             |
| ----------- | ---------- | --------------------|
| text        | text       |  null: false        |
| user_id     | references |  foreign_key: true  |
| item_id     | references |  foreign_key: true  |

### Association

- belongs_to :users
- belongs_to :items

## buyers テーブル

| Column            | Type       | Options             |
| ----------------- | ---------- | --------------------|
| family_name       | string     | null: false         |
| first_name        | string     | null: false         |
| family_name_kana  | string     | null: false         |
| first_name_kana   | string     | null: false         |
| post_code         | string     | null: false         |
| prefecture_id     | integer    | null: false         |
| city              | string     | null: false         |
| address           | string     | null: false         |
| building_name     | integer    | null: true          |
| phone_number      | integer    | null: false         |
| user_id           | references |  foreign_key: true  |
| item_id           | references |  foreign_key: true  |

### Association
- belongs_to :users
- belongs_to :items

## cards テーブル

| Column      | Type       | Options             |
| ----------- | ---------- | --------------------|
| user_id     | references |  foreign_key: true  |
| item_id     | references |  foreign_key: true  |

- belongs_to :users
- belongs_to :items