class Auctioneer < ActiveRecord::Base
	has_many :auction_auctioneer
	has_many :auctions, :through => :auction_auctioneer, dependent: :destroy

	validates :name,	presence: true, 					  
 						uniqueness: true,
 						allow_blank: false

 	# Add Migrations for columns,
 		# License Number w/ Validations
 		# Designations?
end