require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    it "name、price、category_id、condition_id、postage_id、region_id、shipping_date_id、description、imageが存在すれば登録できること" do
      expect(@item).to be_valid
    end
  end

  describe '#登録できない場合' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end    

    it "condition_idが空では登録できないこと" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end 
    
    it "postage_idが空では登録できないこと" do
      @item.postage_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end
    
    it "region_idが空では登録できないこと" do
      @item.region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank")
    end    

    it "shipping_date_idが空では登録できないこと" do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end    

    it "descriptionが空では登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    
    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
    it "priceが299では登録できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    
    it "priceが10000000では登録できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end  
    
    it "priceが全角数字では登録できないこと" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end    
  end








end
