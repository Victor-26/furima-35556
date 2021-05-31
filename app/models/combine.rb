class Combine
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id , :city_etc, :place_num , :building_name, :phone_num , :user_id, :item_id,:token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "には-(ハイフン)が必要です"}
    validates :city_etc
    validates :place_num 
    validates :prefecture_id, numericality: {other_than: 0, message: "都道府県を選択してください"}
    validates :user_id
    validates :item_id
    validates :phone_num,format: { with: /\A\d{10,11}\z/, message: 'は半角11桁以内で入力して下さい。'}
    validates :token
  end  

  def save
    purchase_info = PurchaseInfo.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postcode: postcode, prefecture_id: prefecture_id, city_etc: city_etc, place_num: place_num, building_name: building_name, phone_num: phone_num, purchase_info_id: purchase_info.id )
  end

end