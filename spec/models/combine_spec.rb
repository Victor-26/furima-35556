require 'rails_helper'

RSpec.describe Combine, type: :model do
  describe '商品購入' do
      before do
        @combine = FactoryBot.build(:combine)
      end

      context '内容に問題ない場合' do
        
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@combine).to be_valid
        end 
      end
    

      context '内容に問題がある場合' do
        it 'postcodeが空だと保存できないこと' do
          @combine.postcode = '' 
          @combine.valid?
          expect(@combine.errors.full_messages).to include("Postcode can't be blank")
        end 

        it '郵便番号の保存にはハイフンが必要であること' do
          @combine.postcode = '1231111' 
          @combine.valid?
          expect(@combine.errors.full_messages).to include("Postcode には-(ハイフン)が必要です")
        end 

        it '都道府県が空だと保存できないこと' do
          @combine.prefecture_id = '' 
          @combine.valid?
          expect(@combine.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
        end 

        it '都道府県が未選択では保存できないこと' do
          @combine.prefecture_id = 0
          @combine.valid?
          expect(@combine.errors.full_messages).to include("Prefecture 都道府県を選択してください")
        end

        it '市区町村が空だと保存できないこと' do
          @combine.city_etc = '' 
          @combine.valid?
          expect(@combine.errors.full_messages).to include("City etc can't be blank")
        end 

        it '番地が空だと保存できないこと' do
          @combine.place_num = '' 
          @combine.valid?
          expect(@combine.errors.full_messages).to include("Place num can't be blank")
        end 
        
        it '電話番号が空だと保存できないこと' do
          @combine.phone_num = '' 
          @combine.valid?
          expect(@combine.errors.full_messages).to include("Phone num can't be blank")
        end 

        it '電話番号は半角でないと保存できないこと' do
          @combine.phone_num = '０９０７６５９３００４' 
          @combine.valid?
          expect(@combine.errors.full_messages).to include("Phone num は半角11桁以内で入力して下さい。")
        end 

        it '電話番号は11桁以内の数値のみ保存可能なこと' do
          @combine.phone_num = '０９０７６５９３００４5' 
          @combine.valid?
          expect(@combine.errors.full_messages).to include("Phone num は半角11桁以内で入力して下さい。")
        end 

        it "tokenが空では登録できないこと" do
          @combine.token = nil
          @combine.valid?
          expect(@combine.errors.full_messages).to include("Token can't be blank")
        end

        



        





      end
  
  
  
  
  end  
end