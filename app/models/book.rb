class Book < ActiveRecord::Base
  belongs_to :category

  mount_uploader :image, ImageUploader

  validates :title, presence: true

  validates :author, presence: true

  validates :price, presence: true
end