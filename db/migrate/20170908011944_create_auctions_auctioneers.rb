class CreateAuctionsAuctioneers < ActiveRecord::Migration[5.1]
  def change
  	create_table :auctions_auctioneers do |t|
  		t.integer	:auction_id
  		t.integer 	:auctioneer_id
  	end
  end
end
