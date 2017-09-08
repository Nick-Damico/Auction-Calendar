class User < ActiveRecord::Base
	has_many :auctions
 	has_secure_password

 	validates :email,  presence: true, 					  
 					   uniqueness: true

 	validates :password, presence: true, 						 
 						 allow_blank: false

	validates :username, presence: true,						 
						 allow_blank: false
end