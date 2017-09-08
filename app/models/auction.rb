class Auction < ActiveRecord::Base
	belongs_to :user
	has_many :auctions_auctioneers
	has_many :auctioneers, through: :auctions_auctioneers
end