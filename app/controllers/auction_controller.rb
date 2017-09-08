class AuctionController < ApplicationController

	get '/auctions' do
		if !logged_in?
			redirect to :'/login'
		end
		@auctions = Auction.all
		erb :'auctions/auctions.html'
	end

end