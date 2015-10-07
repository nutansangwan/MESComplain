class AdminController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]

	# def all_users

	# end
	
end