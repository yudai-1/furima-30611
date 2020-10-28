class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :purchase

  validates :post_code, :city, :block_number, :phone_number, :prefecture_id, presence: true

  validates :prefecture_id, numericality: { other_than: 0 }
end
