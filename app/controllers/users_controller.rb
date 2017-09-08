class UsersController < ApplicationController 

	get '/' do
		
		erb :'index.html'
	end

end

# Example of using rack-flash3 messages:
# flash[:message] = "Successfully Launched Auction Calendar."
