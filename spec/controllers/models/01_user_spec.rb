require 'spec_helper'

describe 'User' do
	before do
		@user = User.create(:username => "Eric Benson", :email => "eric@hotmail.com", :password => "happyhour")

	end

	it 'can be initialized' do
		expect(@user).to be_an_instance_of(User)
	end

	it "can have a username" do
		expect(@user.username).to eq("Eric Benson")
	end

	it 'can have an email' do
		expect(@user.email).to eq("eric@hotmail.com")
	end

end