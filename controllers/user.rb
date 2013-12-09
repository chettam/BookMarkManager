class BookmarkManager  < Sinatra::Application
   get '/users/new' do
     haml :'users/new'
   end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/')
  end
end