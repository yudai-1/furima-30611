class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  


  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
    validates :description
    validates :image
  end

end
