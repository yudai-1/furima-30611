class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角漢字、ひらがな、カタカナを使用してください' }
    validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナを使用してください" }
    validates :birth_day
    
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6}+\z/
    validates :password, length: { minimum: 6}, format: { with: VALID_PASSWORD_REGEX}
  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  end
end
