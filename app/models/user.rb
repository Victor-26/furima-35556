class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :items
   has_many :purchase_infos  

    with_options presence: true do
    validates :nickname,:last_name,:first_name,:last_kana,:first_kana,:birth_date
    end 

    validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'はひらがな、漢字、カタカナで入力して下さい。'}
    validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'はひらがな、漢字、カタカナで入力して下さい。'}
    validates :last_kana,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
    validates :first_kana,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}

    

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  

end
