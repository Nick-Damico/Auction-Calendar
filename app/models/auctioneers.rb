class Auctioneer < ActiveRecord::Base
	has_many :auction_auctioneer
	has_many :auctions, :through => :auction_auctioneer, dependent: :destroy

	validates :name, :auctioneer_license,	presence: true

 	validates :auctioneer_license,	length: { is: 6, wrong_length: ":length must be 6 characters" },
 									uniqueness: true
end