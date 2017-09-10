class AuctionController < ApplicationController

	get '/auctions' do
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
		# Process New Auction form data
		if Auction.new(params["auction"]).valid?
			# Flash Error msg require title.
			@auction = current_user.auctions.new(params["auction"])	
			if Auctioneer.new(params["auctioneer"]).valid?
				 @auction.auctioneers.new(params["auctioneer"])
			end
		else
			redirect to '/auctions/new'
		end
		@auction.save
		# Add Auctions/show page for individual auction
		redirect to '/auctions'
	end

	patch '/auctions/:id' do
		@auction = Auction.find(params[:id])
		if current_user.auctions.include?(@auction)
			@auction.update(params["auction"])
		else
			redirect to '/auctions'
		end
		# redirect to individual auction page
		redirect to '/auctions'
	end

end