class UsersController < ApplicationController 

	get '/' do
		erb :'index.html'
	end

	get '/signup' do
		erb :'users/signup.html'
	end

	post '/signup' do
		if User.exists?(email: params["email"])
			redirect to :'/login'
		elsif !User.new(params).valid?
			flash[:message] = "Username/Email already taken"
			erb :'users/signup.html'
		end
		@user = User.create(params)
		session[:id] = @user.id
		redirect to :'/auctions'
	end

	get '/login' do
		redirect to :'/auctions' if logged_in?		
		erb :'users/login.html'
	end

	post '/login' do
		if @user = authorize_user(params)
			session[:id] = @user.id
		else
			redirect to :'/signup'
		end
		redirect to :'/auctions'
	end

	get '/logout' do
		if logged_in?
			session.clear
			redirect to '/login'
		else
			redirect to '/'
		end
	end

	get '/users/:slug' do
		redirect to :'/' if !logged_in?
		if !logged_in?
			redirect to :'/'
		elsif !@user = User.find_by_slug(params[:slug])
			redirect to :'/auctions'
		end
		@autions = @user.auctions
		erb :'users/show.html'
	end

	

end

# Example of using rack-flash3 messages:
# flash[:message] = "Successfully Launched Auction Calendar."
