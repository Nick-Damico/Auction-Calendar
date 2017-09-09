class ChangeTableNameOfAuctionAuctioneer < ActiveRecord::Migration[5.1]
  def change
  	rename_table :auction_auctioneer, :auction_auctioneers
  end
end
