class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :category_id,:condition_id,:which_pay_id,:prefecture_id,:period_id,:price,:image,:name,:explanation
    end 
  
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :which_pay_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :period_id, numericality: { other_than: 0, message: "can't be blank" }
    
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}  
    validates :price,format: { with: /\A[0-9０-９]+\z/, message: 'は半角で入力して下さい。'}

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
    belongs_to :category
    belongs_to :condition
    belongs_to :which_pay
    belongs_to :period
    
end
