require 'rails_helper'

RSpec.describe User, type: :model do
 describe '新規登録' do
  before do
    @user = FactoryBot.build(:user)
  end

      context '新規登録できるとき' do  

        it 'nameとemail、passwordとpassword_confirmationlastname,first_name,first_kana,last_kana,birth_dateが存在すれば登録できること' do
          expect(@user).to be_valid
        end
      end  
       
      context '新規登録できない時' do   
        
        it "nicknameが空だと登録できない" do
          @user.nickname = '' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end  


        it "emailが空だと登録できない" do
          @user.email = '' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end  

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it "emailに@を含まないと登録できない" do
          @user.email = 'tanaka.com' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end  

        it "passwordが空だと登録できない" do
          @user.password = '' 
          @user.valid?
            expect(@user.errors.full_messages).to include("Password can't be blank")
        end  

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '111111ab'
          @user.password_confirmation = '123456ab'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        
        it 'passwordの構成は英数混合６文字以上でないといけない' do
          @user.password = '111111' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end  

        it 'passwordの文字数は６文字以上でないと登録できない' do
          @user.password = '11111' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end  

        it "lastnameが空だと登録できない" do
          @user.last_name = '' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end  

        it "lastname_nameに英字を含むと登録できない" do
          @user.last_name = 'tanaka' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name はひらがな、漢字、カタカナで入力して下さい。")
        end 

        it "first_nameが空だと登録できない" do
          @user.first_name = '' 
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end  

        it "first_nameに英字を含むと登録できない" do
          @user.first_name = 'Tanaka' 
          @user.valid?
          expect(@user.errors.full_messages).to include("First name はひらがな、漢字、カタカナで入力して下さい。")
        end  

        it "last_kanaが空だと登録できない" do
          @user.last_kana = '' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Last kana can't be blank")
        end  

        it "last_kanaには、カタカナ入力以外不可" do
          @user.last_kana = '田中' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Last kana はカタカナで入力して下さい。")
        end  


        it "first_kanaが空だと登録できない" do
          @user.first_kana = '' 
          @user.valid?
          expect(@user.errors.full_messages).to include("First kana can't be blank")
        end  

        it "first_kanaには、カタカナ入力以外不可" do
          @user.first_kana = '太郎' 
          @user.valid?
          expect(@user.errors.full_messages).to include("First kana はカタカナで入力して下さい。")
        end  


        it "birth_dateが空だと登録できない" do
          @user.birth_date = '' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end  
          
      end  
 end
end
