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
      @auctioneer = Auctioneer.find(params[:id])
      erb :'auctioneers/show.html'
    end

    get '/auctioneers/:id/edit' do
    	redirect to '/' if !logged_in?
    	@auctioneer = Auctioneer.find(params[:id])
    	erb :'auctioneers/edit.html'
    end

	post '/auctioneers' do
		if Auctioneer.new(params["auctioneer"]).valid?
			Auctioneer.create(params["auctioneer"])
		else
			# Flash message in future, to notify auctioneer is in DB.
			redirect to '/auctioneers/new'
		end
		erb :'auctioneers/auctioneers.html'
	end

end