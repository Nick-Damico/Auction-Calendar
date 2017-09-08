class CreateAuctioneers < ActiveRecord::Migration[5.1]
  def change
  	create_table do |t|
  		t.string	:name
  	end
  end
end
