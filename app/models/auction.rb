class Auction < ActiveRecord::Base
	belongs_to :user
	has_many :auctions_auctioneers, class_name: "AuctionAuctioneer"
	has_many :auctioneers, :through => :auctions_auctioneers
end