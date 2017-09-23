require './config/environment'

class ApplicationController < Sinatra::Base
	use Rack::Flash
	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "auction_call"
	end

	helpers do

		def authorize_user(params)
	    	User.find_by(:username => params[:username]).try(:authenticate, params[:password])
	    end

		def current_user
	     	@current_user ||= User.find_by(id: session[:id])
	    end

	    def user_exists?(params)
	    	User.exists?(email: params["email"])
	    end

	    def logged_in?
	      !!current_user
	    end

	    def params_to_obj(params)
	    	params.each_key.map do |key|
	    		Object.const_get(key.capitalize).new(params[key])
	    	end
	    end

		def error_msg(params)
	    	params_to_obj(params).each.map do |obj|	
	    		if obj.invalid? && !obj.class.column_names.include?("name")
	    			obj.errors.full_messages 
	    		elsif obj.invalid? && (obj.class.column_names.include?("name") && !obj["name"].empty?)
	    			obj.errors.full_messages
	    		end
	    	end.compact
		end

		def patch_auction_errors(params)
			error_msgs = []
			auction = Auction.new(params["auction"])
			auctioneer = Auctioneer.new(params["auctioneer"])	
			if auction.invalid? 
				error_msgs << auction.errors.full_messages
			elsif auctioneer.invalid? && !params["auctioneer"]["name"].empty?
				error_msgs << auctioneer.errors.full_messages	
			end	
			error_msgs
		end

		def patch_auctioneer_errors(params)
			error_msgs = []
			a = Auctioneer.new(params["auctioneer"])
			if a.invalid? && (a["auctioneer_license"] != params["auctioneer"]["auctioneer_license"])
				error_msgs = a.errors.full_messages
			end
			error_msgs
		end

	end
end