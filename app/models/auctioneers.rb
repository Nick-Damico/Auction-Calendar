class Auctioneer < ActiveRecord::Base
	has_many :auction_auctioneer
	has_many :auctions, :through => :auction_auctioneer
end