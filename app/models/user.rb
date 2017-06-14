class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}

  validates :firstname, presence: true

  validates :lastname, presence: true

  validates :dateofbirth, presence: true

  #validates :image, presence: true

  has_secure_password

  has_many :wishlists
  has_many :books, through: :wishlists

  has_many :shoppingcarts
  has_many :books, through: :shoppingcarts

end