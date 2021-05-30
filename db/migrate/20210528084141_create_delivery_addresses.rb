class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :postcode,              null: false
      t.integer :prefecture_id ,       null: false
      t.string :city_etc,              null: false
      t.string :place_num,             null: false
      t.string :building_name,         null: false
      t.string :phone_num,             null: false
      t.references :purchase_info,     null: false,foreign_key: true
      
      t.timestamps

    end
  end
end
