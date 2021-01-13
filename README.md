## users テーブル

| Column              | Type      | Options      |
| ------------------- | --------- | ------------ |
| nickname            | string    | null: false  |
| email               | string    | unique: true |
| encrypted_password  | string    | null: false  |
| family_name         | string    | null: false  |
| first_name          | string    | null: false  |
| family_name_kana    | string    | null: false  |
| first_name_kana     | string    | null: false  |
| birthday            | date      | null: false  |

### Association
- has_many :items
- has_many :comments through: :items
- has_one : order


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
- has_one : order


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
| building_name     | string     |                     |
| phone_number      | string     | null: false         |
| order             | references |  foreign_key: true  |

### Association
- belongs_to :order

## orders テーブル

| Column      | Type       | Options             |
| ----------- | ---------- | --------------------|
| user        | references |  foreign_key: true  |
| item        | references |  foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer