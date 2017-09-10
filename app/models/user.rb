class User < ActiveRecord::Base
	has_many :auctions, dependent: :destroy
 	has_secure_password

 	validates :email,  presence: true, 					  
 					   uniqueness: true

 	validates :password, presence: true, 						 
 						 allow_blank: false

	validates :username, presence: true,						 
						 allow_blank: false


	def slug
		self.username.downcase.gsub(" ", "-")
	end

	def self.find_by_slug(slug)	
		self.all.find { |user| user.slug == slug}
	end

end