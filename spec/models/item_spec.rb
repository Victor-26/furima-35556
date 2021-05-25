require 'rails_helper'

RSpec.describe Item, type: :model do
 describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '新たに商品出品ができるとき' do  

      it 'image,name,condition_id,category_id,which_pay_id,prefecture.id,priceが存在すれば登録できること' do
        expect(@item).to be_valid
      end 
    end   
    
      context '新規登録できない時' do   
          
        it "nameが空だと登録できない" do
          @item.name = '' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end  

        it "e商品お説明が空だと登録できない" do
          @item.explanation = '' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end  

        it "カテゴリーが選択されていないとと登録できない" do
          @item.category_id = '' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end  

        it "商品の状態が選択されていないとと登録できない" do
          @item.condition_id = '' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end  
       
        it "配送料の負担が選択されていないと登録できない" do
          @item.which_pay_id = '' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Which pay can't be blank")
        end  

        it "発送元地域が選択されていないとと登録できない" do
          @item.prefecture_id = '' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end  

        it "発送までの日数が選択されていないとと登録できない" do
          @item.period_id = '' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Period can't be blank")
        end  

        it "販売価格が入力されていないと登録できない" do
          @item.price = '' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end  

        it "販売価格は半角数字で入力されていないと登録できない" do
          @item.price = '１００００' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end 

        it "販売価格は半角数字で入力されていないと登録できない" do
          @item.price = 'aaaaa' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end 

        it "販売価格は半角数字で入力されていないと登録できない" do
          @item.price = 'あいうえお' 
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end 

        it "販売価格は、300円〜9999999円の範囲でないと登録できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end 

        it "販売価格は、300円〜9999999円の範囲でないと登録できない" do
          @item.price = 10000000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end 



      end  


   


  end  
end