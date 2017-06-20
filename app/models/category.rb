class Category < ActiveRecord::Base
  has_many :books, dependent: :destroy

  validates :categoryname, presence: true, uniqueness: {case_sensitive: false}
end