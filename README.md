# テーブル設計

## usersテーブル

| Column            | Type   | Options                   |
|-------------------|--------|---------------------------|
|nick_name          | string | null: false               |
|email              | string | null: false, unique: true |
|encrypted_password | string | null: false               |
|last_name          | string | null: false               |
|first_name         | string | null: false               |
|last_name_kana     | string | null: false               |
|first_name_kana    | string | null: false               |
|birthday           | date   | null: false               |

### Association

- has_many :comments
- has_many :products
- has_many :purchase_lists

## productsテーブル

| Column            | Type       | Options                       |
|-------------------|------------|-------------------------------|
|user (fk)         | references | null: false, foreign_key: true|
|product_name       | string     | null: false                   |
|product_text       | text       | null: false                   |
|categpry_id        | integer    | null: false                   |
|product_status_id  | integer    | null: false                   |
|delivery_charge_id | integer    | null: false                   |
|shipping_area_id   | integer    | null: false                   |
|shipinng_day_id    | integer    | null: false                   |
|price              | integer    | null: false                   |

### Association

- belongs_to :user
- has_one :purchase_list
- has_many :comments

## shipping_addressesテーブル

| Column            | Type       | Options                       |
|-------------------|------------|-------------------------------|
|purchase_list      | references | null: false, foreign_key: true|
|postal_code        | string     | null: false                   |
|prefectures        | integer    | null: false                   |
|municipality       | string     | null: false                   |
|addres             | string     | null: false                   |
|building_name      | string     |                               |
|phone_number       | string     | null: false                   |

### Association

- belongs_to :purchase_list

## purchase_listsテーブル

| Column   | Type       | Options                       |
|----------|------------|-------------------------------|
|user      |references  |null: false, foreign_key: true |
|product   |references  |null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one : shipping_adress

## commentsテーブル

| Column   | Type       | Options                       |
|----------|------------|-------------------------------|
|user      |references  |null: false, foreign_key: true |
|product   |references  |null: false, foreign_key: true |
|text      |text        |null: false                    |

### Association

- belongs_to :user
- belongs_to :product