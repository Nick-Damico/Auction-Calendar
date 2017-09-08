class AuctionAuctioneer < ActiveRecord::Base 
	belongs_to :auction_id
	belongs_to :auctioneer_id
end