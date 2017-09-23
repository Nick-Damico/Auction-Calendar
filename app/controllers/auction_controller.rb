class AuctionController < ApplicationController

	get '/auctions' do		
		redirect to :'/login' if !logged_in?

		@auctions = Auction.all
		erb :'auctions/auctions.html'
	end

	get '/auctions/new' do
		redirect to :'/' if !logged_in?
		erb :'auctions/new.html'
	end

	get '/auctions/:id' do
		redirect to '/login' if !logged_in?
		
		@auction = Auction.find(params[:id])
		erb :'auctions/show.html'
	end

	get '/auctions/:id/edit' do	
		redirect to '/' if !logged_in?
		@auction = Auction.find(params[:id])			
		redirect to '/auctions'	if !current_user.auctions.include?(@auction)
			
		erb :'auctions/edit.html'
	end

	post '/auctions' do
		flash[:message] = error_msg(params)
		redirect to '/auctions/new' if !flash[:message].empty?

		auction = current_user.auctions.new(params["auction"])
		auctioneer = Auctioneer.new(params["auctioneer"])
		auction.auctioneers << auctioneer if auctioneer.valid?
		auction.save
		redirect to "/auctions/#{auction.id}"		
	end

	patch '/auctions/:id' do
		flash[:message] = patch_auction_errors(params)
		auction = Auction.find(params[:id])
		redirect to "/auctions/#{auction.id}/edit" if !flash[:message].empty?
		
		auction.update(params["auction"])		
		auctioneer = Auctioneer.new(params["auctioneer"])
		auction.auctioneers << auctioneer if auctioneer.valid?
		auction.save
		redirect to "/auctions/#{auction.id}"
	end

	delete '/auctions/:id' do
		Auction.destroy(@auction.id) if @auction = current_user.auctions.find(params[:id])			
		redirect to '/auctions'
	end

end


