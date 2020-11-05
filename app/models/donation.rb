class Donation 
  include ActiveModel::Model
  attr_accessor :post_code, :city, :block_number, :building_name, :phone_number, :prefecture_id, :purchases_id, :item_id, :user_id, :token


  with_options presence: true do
    validates :city, :block_number, :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    Address.create(post_code: post_code, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id, purchases_id: purchases_id)

    Purchase.create(item_id: item_id, user_id: user_id)
  end
end