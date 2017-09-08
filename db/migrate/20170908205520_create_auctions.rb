class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
  	create_table :auctions do |t|
  		t.string	:title
  		t.string	:location
  		t.text		:description
  		t.string	:start_date
  		t.string	:start_time
  		t.string	:preview_date
  		t.string	:preview_time
  		t.integer	:user_id
  	end
  end
end
