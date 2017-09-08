class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
  	create_table :auctions do |t|
  		t.string	:title
  		t.string	:location
  		t.text		:description
  		t.string	:start_time
  		t.string	:end_time
  		t.string	:preview
      t.string  :img_url
  		t.integer	:user_id
  	end
  end
end
