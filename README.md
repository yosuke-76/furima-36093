# テーブル設計

## usersテーブル

| Column            | Type   | Options                   |
|-------------------|--------|---------------------------|
|nick name          | string | null: false               |
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
- has_one :purchase_lists
- has_one :shipping_addres

## productsテーブル

| Column            | Type       | Options                       |
|-------------------|------------|-------------------------------|
|user_id (fk)       | references | null: false, foreign_key: true|
|product_name       | string     | null: false                   |
|product_text       | text       | null: false                   |
|categpry           | string     | null: false                   |
|product_status     | string     | null: false                   |
|delivery_charge    | string     | null: false                   |
|shipping_area      | string     | null: false                   |
|shipinng_days      | string     | null: false                   |
|price              | integer    | null: false                   |

### Association

- belongs_to :user
- has_one :purchase_list
- has_many :comments

## shipping_adressテーブル

| Column            | Type       | Options                       |
|-------------------|------------|-------------------------------|
|purchase_lists     | references | null: false, foreign_key: true|
|users              | references | null: false, foreign_key: true|
|postal_code        | string     | null: false                   |
|prefectures        | string     | null: false                   |
|municipality       | string     | null: false                   |
|addres             | string     | null: false                   |
|building_name      | string     | null: false                   |
|phone_number       | integer    | null: false                   |

### Association

- belongs_to :user
- belongs_to :purchase_list

## purchase_listテーブル

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