class Auction < ActiveRecord::Base
	belongs_to :user
	has_many :auction_auctioneer
	has_many :auctioneers, :through => :auction_auctioneer, dependent: :destroy

	validates :title,	presence: true, 					  
 						uniqueness: true,
 						allow_blank: false

 	validates :description,		presence: true, 					  
 								uniqueness: true,
 								allow_blank: false
end