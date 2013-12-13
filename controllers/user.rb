class BookmarkManager  < Sinatra::Application
   get '/users/new' do
     @user = User.new
     haml :'users/new'
   end

  post '/users' do
    @user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      haml :main
    end
  end

  get '/users/reset' do
    if params[:token].nil?
      haml :'users/reset'
    else
      user = retrieve_user(params[:token])
      if acceptable_time_difference?(user.password_token_timestamp)
        @token =user.password_token
        haml :'users/reset_password'
      else
        flash.now[:error] = 'you password reset request times out, make sure to complete the process in less than 15 minutes'
        haml :main
      end
    end
  end

  post '/users/reset' do
    if !User.first(email: params[:email]).nil?
      token=password_recovery_token(params[:email])
      send_simple_message(params[:email],token)
      flash.now[:notice] = 'Please check your email for your reset link'
      haml :'users/reset'
    elsif !params[:email].nil?
      flash.now[:error] = 'This email is invalid'
      haml :'users/reset'
    else
      haml :'users/reset'
    end
  end

  post '/users/reset-password' do
    user = retrieve_user(params[:token])
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    if user.save &&
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = user.errors.full_messages
      haml :main
    end
  end

end