class CreateAuctionAuctioneer < ActiveRecord::Migration[5.1]
  def change
  	create_table :auction_auctioneer do |t|
  		t.integer	:auction_id
  		t.integer	:auctioneer_id
  	end
  end
end
