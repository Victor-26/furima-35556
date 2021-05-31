FactoryBot.define do
  factory :combine do
    postcode { '123-4567' }
    prefecture_id { 3 }
    city_etc { '堺市' }
    place_num { '1-1' }
    building_name { '大阪ハイツ' }
    phone_num { '09045693228' }
    user_id   {1}
    item_id   {1}
    token {"tok_abcdefghijk00000000000000000"}
    

  end
end

