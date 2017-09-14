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

	 # Need to implement a way if failure do to validation the input
		#  fields completed keep information on redirect.
	post '/auctions' do
		auction = Auction.new(params["auction"])
		auctioneer = Auctioneer.new(params["auctioneer"])		
		if auction.invalid? || auctioneer.invalid?
			flash[:message] = auction.errors.full_messages	if auction.invalid?
			flash[:message] = auctioneer.errors.full_messages if auctioneer.invalid? && !params["auctioneer"]["name"].empty?
			redirect to '/auctions/new'
		end	
		@auction = current_user.auctions.new(params["auction"])
		@auction.auctioneers << auctioneer if auctioneer.valid?
		@auction.save
		redirect to "/auctions/#{@auction.id}"		
	end

	patch '/auctions/:id' do
		flash[:message] = [] 
		@auction = Auction.find(params[:id])
		auctioneer = Auctioneer.new(params["auctioneer"])
		if @auction.invalid? || auctioneer.invalid?
			flash[:message] << @auction.errors.full_messages	if @auction.invalid?
			flash[:message] << auctioneer.errors.full_messages if auctioneer.invalid? && !params["auctioneer"]["name"].empty?
			redirect to "/auctions/#{@auction.id}/edit"
		end	
		@auction.update(params["auction"])		
		@auction.auctioneers << auctioneer if auctioneer.valid?
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


