class Book < ActiveRecord::Base
  belongs_to :category

  mount_uploader :image, ImageUploader

  validates :title, presence: true

  validates :author, presence: true

  validates :price, presence: true

  has_many :wishlists
  has_many :users, through: :wishlists

  has_many :shoppingcarts
  has_many :users, through: :shoppingcarts

  has_many :checkouts
  has_many :users, through: :checkouts

  has_many :orders
  has_many :users, through: :orders
end