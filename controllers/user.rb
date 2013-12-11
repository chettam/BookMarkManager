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
      haml :'/users/new'
    end
  end

  get '/users/reset' do
    haml :'users/reset'
  end

  post '/users/reset' do
   token = password_recovery_token(params[:email])
   send_simple_message(token)
  end

end