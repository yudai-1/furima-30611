require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe '購入の保存' do
    before do
      @donation = FactoryBot.build(:donation)
    end
  

    it '郵便番号・都道府県・市区町村・番地・電話番号が必須であること' do
      expect(@donation).to be_valid
    end

    it 'post_codeが空だと保存できないこと' do
      @donation.post_code = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @donation.post_code = '1234567'
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'prefecture_idを選択していないと保存できないこと' do
      @donation.prefecture_id = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが0だと保存できないこと' do
      @donation.prefecture_id = 0
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it 'cityが空だと保存できないこと' do
      @donation.city = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("City can't be blank")
    end    

    it 'block_numberが空だと保存できないこと' do
      @donation.block_number = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Block number can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @donation.building_name = nil
      expect(@donation).to be_valid
    end

    it 'phone_numberは10桁は保存できること' do
      @donation.phone_number = "0901234567"
      expect(@donation).to be_valid
    end

    it 'phone_numberは11桁は保存できること' do
      @donation.phone_number = "09012345678"
      expect(@donation).to be_valid
    end    

    it 'phone_numberは9桁では保存できないこと' do
      @donation.phone_number = "090123456"
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberは12桁では保存できないこと' do
      @donation.phone_number = "090123456789"
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Phone number is invalid")
    end    

    it 'phone_numberが数字以外では保存できないこと' do
      @donation.phone_number = "電話"
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Phone number is invalid")
    end    

    it "tokenがあれば保存ができること" do
      expect(@donation).to be_valid
    end    

    it "tokenが空では登録できないこと" do
      @donation.token = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Token can't be blank")
    end    

  end
end
