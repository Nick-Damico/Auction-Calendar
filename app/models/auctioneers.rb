class Auctioneer < ActiveRecord::Base
	has_many :auctions_auctioneers, class_name: "AuctionAuctioneer"
	has_many :auctions, :through => :auctions_auctioneers
end