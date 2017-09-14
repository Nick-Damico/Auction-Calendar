class AddColumnsToAuctioneersTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :auctioneers, :bio, :text
  	add_column :auctioneers, :auctioneer_license, :text
  end
end
