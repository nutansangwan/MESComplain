class User<UserController
 include Mongoid::Document
 store_in database: ->{ Thread.current[:database] }
field :user_name ,type: String
field :password ,type: String  

  def login params
  	#render json: User.new.Login(params)

  	return {status: true ,msg: "aa gya"}
  end	


  # ...
end