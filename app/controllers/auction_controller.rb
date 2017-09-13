class AuctionController < ApplicationController

	get '/auctions' do
		# Removes [:message] for signup failure
		flash[:message].clear if flash[:message]
		if !logged_in?
			redirect to :'/login'
		end
		@auctions = Auction.all
		erb :'auctions/auctions.html'
	end

	get '/auctions/new' do
		redirect to :'/' if !logged_in?
		erb :'auctions/new.html'
	end

	get '/auctions/:id' do
		if !logged_in?
			redirect to '/users/login'
		end
		@auction = Auction.find(params[:id])
		erb :'auctions/show.html'
	end

	get '/auctions/:id/edit' do	
		@auction = Auction.find(params[:id])			
		if !logged_in?
			redirect to '/' 
		elsif !current_user.auctions.include?(@auction)
			redirect to '/auctions'		
		else
			erb :'auctions/edit.html'
		end
	end

	post '/auctions' do
		if Auction.new(params["auction"]).valid?
			@auction = current_user.auctions.new(params["auction"])	
			if Auctioneer.new(params["auctioneer"]).valid?
				 @auction.auctioneers.new(params["auctioneer"])
			end
		else
			redirect to '/auctions/new'
		end
		@auction.save
		redirect to "/auctions/#{@auction.id}"
	end

	patch '/auctions/:id' do
		@auction = Auction.find(params[:id])
		if current_user.auctions.include?(@auction) && @auction.valid?
			@auction.update(params["auction"])
			if Auctioneer.new(params["auctioneer"]).valid? 
				@auction.auctioneers << Auctioneer.create(params["auctioneer"])
			end
		else
			redirect to '/auctions'
		end
		@auction.save
		redirect to "/auctions/#{@auction.id}"
	end

	delete '/auctions/:id' do
		if @auction = current_user.auctions.find(params[:id])
			Auction.destroy(@auction.id)
		end
		redirect to '/auctions'
	end

end