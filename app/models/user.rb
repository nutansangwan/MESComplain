class User
 include Mongoid::Document
 #store_in database: ->{ Thread.current[:database] }
  #store_in database:"mes_complain_test"

  field :user_name ,type: String
  field :password ,type: String  

  def sign_in params
    #render json: User.new.Login(params)
   users = User.all.to_a
   status_user=false
   for i in 0..users.size
      if users[i].user_name == params[:user_name] && users[i].password == params[:password] then
       status_user = true
        break
      end
    end
  
    return {status: status_user}
  end	


  def sign_up params

    User.new(user_name: params[:user_name], password: params[:password]).save!
  end

  def get_all_users
    return User.all.to_a
  end
  # ...
end