class Category < ActiveRecord::Base
	has_many :books	

	validates :categoryname, presence: true, uniqueness: {case_sensitive: false}
end