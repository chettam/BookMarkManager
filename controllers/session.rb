class BookmarkManager  < Sinatra::Application
  get '/sessions/new' do
    haml :'sessions/new', layout: !request.xhr?
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password are incorrect']
      haml :main
    end
  end

  delete '/sessions' do
    flash[:notice] = 'Good bye!'
    session[:user_id] = nil
    redirect to('/')
  end

  get 'sessions/new' do
    haml :'sessions/new'
  end

end