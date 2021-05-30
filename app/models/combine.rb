class Combine
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id , :city_etc, :place_num , :building_name, :phone_num , :user_id, :item_id

  with_options presence: true do
    validates :postcode
    validates :city_etc
    validates :place_num 
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :user_id
    validates :item_id
    validates :phone_num,format: { with: /\A[0-9０-９]+\z/, message: 'は半角で入力して下さい。'}
  end  

  def save
    purchase_info = PurchaseInfo.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postcode: postcode, prefecture_id: prefecture_id, city_etc: city_etc, place_num: place_num, building_name: building_name, phone_num: phone_num, purchase_info_id: purchase_info.id )
  end

end