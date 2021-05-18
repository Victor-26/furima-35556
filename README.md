# テーブル設計

## users テーブル

| Column       | Type       | Options     |
| ------------ | -----------| ----------- |
| nickname     | string     | null: false |
| email        | string     | null: false |
| password     | string     | null: false |
| last_name    | string     | null: false |
| first_name   | string     | null: false |
| last_kana    | string     | null: false |
| first_kana   | string     | null: false |
| birth_date   | integer-id | null: false |



### Association

- has_many :items
- has_many :purchase_info


## items テーブル

|  Column     |   Type     | Options                        |
| ----------- | ---------- | -----------------------------  |
|  item_name  |   string   | null: false                    |
| explanation |   text     | Options                        |
| category    | integer-id | null: false                    |
| condition   | integer-id | null: false                    |
| ship_from   | integer-id | null: false                    |                        
| period      | integer-id | null: false                    |                            
| item_price  | string     | null: false                    |                     
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_info


## purchase_info テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :delivery_address

## delivery_address テーブル

|  Column       |   Type     | Options                        |
| ------------- | ---------- | -----------------------------  |
| postcode      |   string   | null: false                    |
| prefecture    | integer-id | null: false                    |
| city_etc      |   text     | null: false                    |
| place_num     |   string   | null: false                    |
| building_name |   text     | null: false                    |                        
| phone_num     |   string   | null: false                    |                            
| purchase_info | references | null: false, foreign_key: true |
                    
### Association

- belongs_to :pupurchase_info

