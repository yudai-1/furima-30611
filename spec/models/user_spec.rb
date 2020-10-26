require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it "nickname、email、password、password_confirmation、family_name、first_name、family_name_kana、first_name_kana、birth_dayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "passwordが英数字6文字以上であれば登録できること" do
      @user.password = "12345a"
      @user.password_confirmation = "12345a"
      expect(@user).to be_valid
    end    
  end

  describe '#異常系' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end    

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end    

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end    

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end    

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "passwordが英数字混合だが、5文字以下であれば登録できないこと" do
      @user.password = "1234a"
      @user.password_confirmation = "1234a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "family_nameが空では登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    
    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end    

    it "family_name_kanaが空では登録できないこと" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end 
    
    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end    
    
    it "family_nameが全角漢字、ひらがな、カタカナでなければ登録できないこと" do
      @user.family_name =  "ｱｲｳｴｵaＢ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角漢字、ひらがな、カタカナを使用してください")
    end

    it "first_nameが全角漢字、ひらがな、カタカナでなければ登録できないこと" do
      @user.first_name =  "ｱｲｳｴｵaＢ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角漢字、ひらがな、カタカナを使用してください")
    end
    
    it "family_name_kanaが全角カタカナでなければ登録できないこと" do
      @user.family_name_kana =  "ｱｲｳｴｵaＢあ阿"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを使用してください")
    end

    it "first_name_kanaが全角カタカナでなければ登録できないこと" do
      @user.first_name_kana =  "ｱｲｳｴｵaＢあ阿"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
    end    

    it "birth_dayが空では登録できないこと" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end    
end
