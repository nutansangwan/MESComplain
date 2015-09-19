class UserController < ApplicationController
include Mongoid::Document
store_in database: ->{ Thread.current[:database] }
field :user_name ,type: String
field :password, type: String  

skip_before_filter :verify_authenticity_token
def login 

	render json: User.new.login(params).to_json

end



end
