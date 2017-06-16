class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "never_trust_the_ide"
  end

  get '/' do
    if logged_in?
      erb :'index'
    else
      erb :'index_logged_out'
    end
  end

  get '/signup' do
    if logged_in?
      redirect to '/'
    else
      erb :'/users/sign_up'
    end
  end

  helpers do
     def logged_in?
       !!session[:user_id]
     end

     def current_user
       User.find(session[:user_id])
     end

   end
end
