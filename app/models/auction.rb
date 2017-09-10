class Auction < ActiveRecord::Base
	belongs_to :user
	has_many :auction_auctioneer
	has_many :auctioneers, :through => :auction_auctioneer, dependent: :destroy
end