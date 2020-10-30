class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :purchase
  with_options presence: true do
    validates :post_code, :city, :block_number, :phone_number, :prefecture_id

    validates :prefecture_id, numericality: { other_than: 0 }
  end  
end
