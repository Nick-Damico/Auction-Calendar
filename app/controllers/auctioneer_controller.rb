class AuctioneerController < ApplicationController

	get '/auctioneers' do
		if !logged_in?
			redirect to '/'
		end
		@auctioneers = Auctioneer.all
		erb :'auctioneers/auctioneers.html'
	end

end