class Auctioneer < ActiveRecord::Base
	has_many :auction_auctioneer
	has_many :auctions, :through => :auction_auctioneer

	validates :name,	presence: true, 					  
 						uniqueness: true

 	# Add Migrations for columns,
 		# License Number w/ Validations
 		# Designations?
end