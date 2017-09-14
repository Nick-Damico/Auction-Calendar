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
		a = Auctioneer.new(params["auctioneer"])
		if a.invalid?
			flash[:message] = a.errors.full_messages
			redirect to '/auctioneers/new'
		end
		a.save
		erb :'auctioneers/auctioneers.html'
	end

	patch '/auctioneers/:id' do
		@auctioneer = Auctioneer.find(params[:id])		
		if params["auction_ids"] == nil
			@auctioneer.auctions.destroy_all
		end
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