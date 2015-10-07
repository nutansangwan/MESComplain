class User
 include Mongoid::Document
 #store_in database: ->{ Thread.current[:database] }
  #store_in database:"mes_complain_test"

  field :user_name ,type: String
  field :password ,type: String  

  def sign_in params
    #render json: User.new.Login(params)
   users = User.all.to_a
   user = params[:user]
   status_user=false
   for i in 0..users.size
    puts "test"
      if users[i].user_name == user["user_name"] && users[i].password == user["password"] then
        status_user = true
        break
      end
    end
    puts status_user
    return {status: status_user,userName: user["user_name"],password: user["password"]}
  end	


  def sign_up params

    # User.new(user_name: params[:user_name], password: params[:password]).save!
  end

  def get_all_users
    return User.all.to_a
  end

  def save_new_user params
    user = params[:user]
    if User.new(user_name: user["user_name"], password: user["password"]).save!
      return {status: "user created sucessfully"}
    else
      return {status: "cannot create user"}
    end
  end
  # ...
end