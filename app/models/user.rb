class User < ActiveRecord::Base
	has_many :auctions, dependent: :destroy
 	has_secure_password

 	validates :password, :email, :username,	presence: true

	validates :email,	uniqueness: true

	def slug
		self.username.downcase.gsub(" ", "-")
	end

	def self.find_by_slug(slug)	
		self.all.find { |user| user.slug == slug}
	end

end