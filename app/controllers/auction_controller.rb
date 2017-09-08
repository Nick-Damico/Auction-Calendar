class AuctionController < ApplicationController

	get '/auctions' do
		erb :'auctions/auctions.html'
	end

end