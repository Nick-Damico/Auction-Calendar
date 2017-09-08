class UsersController < ApplicationController 

	get '/' do
		erb :'index.html'
	end

	get '/signup' do
		erb :'users/signup.html'
	end

	post '/signup' do
		binding.pry
	end

end

# Example of using rack-flash3 messages:
# flash[:message] = "Successfully Launched Auction Calendar."
