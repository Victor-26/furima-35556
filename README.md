# テーブル設計

## users テーブル

| Column              | Type       | Options     |
| ------------------- | -----------| ----------- |
| nickname            | string     | null: false |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false |
| last_name           | string     | null: false |
| first_name          | string     | null: false |
| last_kana           | string     | null: false |
| first_kana          | string     | null: false |
| birth_date          | date       | null: false |



### Association

- has_many :items
- has_many :purchase_infos


## items テーブル

|  Column        |   Type     | Options                        |
| ---------------| ---------- | -----------------------------  |
|  name          |   string   | null: false                    |
| explanation    |   text     | null: false                    |
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    |
| which_pay_id   | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |                        
| period_id      | integer    | null: false                    |                            
| price          | integer    | null: false                    |                     
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_info


## purchase_infos テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addresses テーブル

|  Column       |   Type     | Options                        |
| ------------- | ---------- | -----------------------------  |
| postcode      |   string   | null: false                    |
| prefecture_id |  integer   | null: false                    |
| city_etc      |   string   | null: false                    |
| place_num     |   string   | null: false                    |
| building_name |   string   |                                |                        
| phone_num     |   string   | null: false                    |                            
| purchase_info | references | null: false, foreign_key: true |
                    
### Association

- belongs_to :pupurchase_info

