class Auctioneer < ActiveRecord::Base
	has_many :auctions_auctioneers
	has_many :auctions, through: :auctions_auctioneers
end