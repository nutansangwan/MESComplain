class UserController < ApplicationController
 

skip_before_filter :verify_authenticity_token


def sign_in

	render json: User.new.sign_in(params)

end

def get_all_users
	result = User.new.get_all_users()
	
	render json: result
end

def sign_up
	new_user = User.new
  	render json: new_user.sign_up(params)  
end


end
