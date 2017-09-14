class Auctioneer < ActiveRecord::Base
	has_many :auction_auctioneer
	has_many :auctions, :through => :auction_auctioneer, dependent: :destroy

	validates :name,	presence: true, 					  
 						uniqueness: true,
 						allow_blank: false

 	validates :auctioneer_license,	presence: true,
 									uniqueness: true
 									allow_blank: false
end