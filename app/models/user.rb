class User < ActiveRecord::Base
	has_many :auctions
 	has_secure_password

 	validates :email,  presence: true,
 					   length: { minimum: 2 },
 					   allow_blank: false

 	validates :password, presence: true,
 						 length: { in: 6..20 },
 						 allow_blank: false

	validates :username, presence: true,
						 length: { minimum: 2 },
						 allow_blank: false
end