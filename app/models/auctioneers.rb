class Auctioneer < ActiveRecord::Base
	has_many :auction_auctioneers
	has_many :auctions, :through => :auction_auctioneers
end