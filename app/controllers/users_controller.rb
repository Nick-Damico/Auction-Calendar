class UsersController < ApplicationController 

	get '/' do
		erb :'index.html'
	end

	get '/signup' do
		redirect to '/auctions' if logged_in?
		@user = User.new
		erb :'users/signup.html'
	end

	post '/signup' do
		redirect to '/auctions' if logged_in?
		@user = User.new(params)
		if @user.save
			session[:user_id] = @user.id
			redirect to '/auctions'
		else 
			flash[:message] = @user.errors.full_messages.join(', ')
			erb :'users/signup.html'
		end
	end

	get '/login' do
		redirect to :'/auctions' if logged_in?		
		erb :'users/login.html'
	end

	post '/login' do
		unless user = authorize_user(params)
			flash[:message] = "Username or Password incorrect"
			redirect to '/login' 					
		end
		session[:user_id] = user.id
		redirect to :'/auctions'
	end

	get '/logout' do
		redirect to '/' if !logged_in?
					
		session.clear
		redirect to '/login'
	end

	get '/users/:slug' do		
		redirect to :'/' if !logged_in?		
		redirect to :'/auctions' if !@user = User.find_by_slug(params[:slug])		
		
		@autions = @user.auctions		
		erb :'users/show.html'		
 	end

end

