class AuctioneerController < ApplicationController

	get '/auctioneers' do
		redirect to '/' if !logged_in?
		@auctioneers = Auctioneer.all
		erb :'auctioneers/auctioneers.html'
	end

	get '/auctioneers/new' do
		redirect to '/' if !logged_in?
		erb :'auctioneers/new.html'
	end

	 get '/auctioneers/:id' do
	 	redirect to '/' if !logged_in?
	 	if !@auctioneer = Auctioneer.find_by(id: params[:id])
	 		redirect to '/auctioneers'
      	end
      erb :'auctioneers/show.html'
    end

    get '/auctioneers/:id/edit' do
    	redirect to '/' if !logged_in?
    	@auctioneer = Auctioneer.find(params[:id])
    	erb :'auctioneers/edit.html'
    end

	post '/auctioneers' do
		@auctioneer = Auctioneer.new(params["auctioneer"])
		flash[:message] = error_msg(params)
		redirect to '/auctioneers/new' unless flash[:message].empty?
		
		@auctioneer.save
		redirect to "/auctioneers/#{@auctioneer.id}"
	end

	patch '/auctioneers/:id' do
		@auctioneer = Auctioneer.find(params[:id])
		flash[:message] = patch_auctioneer_errors(params)
		redirect to "/auctioneers/#{@auctioneer.id}/edit" if !flash[:message].empty?

		@auctioneer.auctions.destroy_all if params["auction_ids"].nil?
			
		@auctioneer.update(params["auctioneer"])
		redirect to "/auctioneers/#{@auctioneer.id}"
	end

	delete '/auctioneers/:id' do
		Auctioneer.destroy(@auctioneer.id) if @auctioneer = Auctioneer.find(params[:id])
		redirect to '/auctioneers'
	end

end