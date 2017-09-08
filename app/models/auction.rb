class Auction < ActiveRecord::Base
	belongs_to :user
	has_many :auction_auctioneers
	has_many :auctioneers, :through => :auction_auctioneers
end