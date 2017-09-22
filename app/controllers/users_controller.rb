class UsersController < ApplicationController 

	get '/' do
		erb :'index.html'
	end

	get '/signup' do
		redirect to '/auctions' if logged_in?
		erb :'users/signup.html'
	end

	post '/signup' do
		if User.exists?(email: params["email"])
			flash[:message] = "Email already in Use"
			redirect to '/signup'
		else User.new(params).valid?
			user = User.create(params)
			session[:id] = user.id
		end			
			redirect to '/auctions'	
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
		session[:id] = user.id
		redirect to :'/auctions'
	end

	get '/logout' do
		redirect to '/' if !logged_in?
					
		session.clear
		redirect to '/login'
	end

end

