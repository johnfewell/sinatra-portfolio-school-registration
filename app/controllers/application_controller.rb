require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "if_it_aint_baroque"
  end

  get '/' do
    if logged_in?
      erb :'index'
    else
      erb :'index_logged_out'
    end
  end

  post '/' do
    @user = Student.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/"
    else
      flash[:message] = "Email or password incorrect."
      redirect to '/'
    end
  end

  get '/logout' do
    if !!session[:user_id]
      session.destroy
    end
      redirect to '/'
  end

  get '/signup' do
    if logged_in?
      redirect to '/'
    else
      erb :'/users/sign_up'
    end
  end

  post '/signup' do
    if params.any? { |k, v| v.length <=2 }
      flash[:message] = "Your name or password must be longer than two characters."
      redirect to '/signup'
    else
      @user = Student.new(:name => params[:name], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/'
    end
  end

  get '/profile' do
    erb :'/users/profile'
  end

  helpers do
     def logged_in?
       !!session[:user_id]
     end

     def is_admin?
       session[:user_id] == admin_id
     end

     #Set the ID of the admin user here
     def admin_id
       9
     end

     def login_flash
       flash[:message] = "Please log in first."
     end

     def not_allowed_flash
       flash[:message] = "You aren't allowed to do that."
     end

     def name_require_flash
       flash[:message] = "A name is required."
     end

     def current_user
         @user = Student.find(session[:user_id])
     end
   end
end
