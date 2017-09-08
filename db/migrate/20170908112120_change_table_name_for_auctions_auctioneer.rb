class ChangeTableNameForAuctionsAuctioneer < ActiveRecord::Migration[5.1]
  def change
  	rename_table :auctions_auctioneers, :auction_auctioneers
  end
end
