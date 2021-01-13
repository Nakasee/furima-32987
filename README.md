## users テーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ------------|
| nickname            | string    | null: false |
| email               | string    | null: false |
| encrypted_password  | string    | null: false |
| family_name         | string    | null: false |
| first_name          | string    | null: false |
| family_name_kana    | string    | null: false |
| first_name_kana     | string    | null: false |
| birthday            | date      | null: false |

### Association
- has_many :items
- has_many :comments through: :items
- has_one : byers
- has_one : cards


## items テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ------------------|
| name           | string     | null: false       |
| price          | integer    | null: false       |
| description    | text       | null: false       |
| category_id    | integer    | null: false       |
| judgment_id    | integer    | null: false       |
| cost_id        | integer    | null: false       |
| prefecture_id  | integer    | null: false       |
| day_id         | integer    | null: false       |
| user           | references | foreign_key: true |

### Association
- has_many :comments
- belongs_to :user
- has_one : byers
- has_one : cards


## comments テーブル

| Column      | Type       | Options             |
| ----------- | ---------- | --------------------|
| text        | text       |  null: false        |
| user        | references |  foreign_key: true  |
| item        | references |  foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item

## buyers テーブル

| Column            | Type       | Options             |
| ----------------- | ---------- | --------------------|
| post_code         | string     | null: false         |
| prefecture_id     | integer    | null: false         |
| city              | string     | null: false         |
| address           | string     | null: false         |
| building_name     | integer    | null: true          |
| phone_number      | string     | null: false         |
| user              | references |  foreign_key: true  |
| item              | references |  foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item

## cards テーブル

| Column      | Type       | Options             |
| ----------- | ---------- | --------------------|
| user_id     | references |  foreign_key: true  |
| item_id     | references |  foreign_key: true  |

- belongs_to :user
- belongs_to :item