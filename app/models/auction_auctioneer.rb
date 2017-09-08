class AuctionAuctioneer < ActiveRecord::Base 
	belongs_to :auction
	belongs_to :auctioneer
end