class AuctioneerController < ApplicationController

	get '/auctioneers' do
		if !logged_in?
			redirect to '/'
		end
		@auctioneers = Auctioneer.all
		erb :'auctioneers/auctioneers.html'
	end

	get '/auctioneers/new' do
		redirect to '/' if !logged_in?
		erb :'auctioneers/new.html'
	end

	 get '/auctioneers/:id' do
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
		flash[:message] = get_auctioneer_error_msgs(params)
		redirect to '/auctioneers/new' unless flash[:message].empty?
		
		@auctioneer.save
		redirect to "/auctioneers/#{@auctioneer.id}"
	end

	patch '/auctioneers/:id' do
		@auctioneer = Auctioneer.find(params[:id])
		flash[:message] = get_auctioneer_error_msgs(params)
		redirect to "/auctioneers/#{@auctioneer.id}/edit" unless flash[:message].empty?

		@auctioneer.auctions.destroy_all if params["auction_ids"].nil?
			
		@auctioneer.update(params["auctioneer"])
		redirect to "/auctioneers/#{@auctioneer.id}"
	end

	delete '/auctioneers/:id' do
		if @auctioneer = Auctioneer.find(params[:id])
			Auctioneer.destroy(@auctioneer.id)
		end
		redirect to '/auctioneers'
	end

end