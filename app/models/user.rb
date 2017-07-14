class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 105}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}

  validates :firstname, presence: true

  validates :lastname, presence: true

  validates :dateofbirth, presence: true

  #validates :image, presence: true

  has_many :wishlists, dependent: :destroy
  has_many :books, through: :wishlists

  has_many :shoppingcarts, dependent: :destroy
  has_many :books, through: :shoppingcarts

  has_many :checkouts, dependent: :destroy
  has_many :books, through: :checkouts

  has_many :orders, dependent: :destroy
  has_many :books, through: :orders

  has_many :shippingaddresses, dependent: :destroy

  has_many :receipts, dependent: :destroy

  serialize :freq_tag
end