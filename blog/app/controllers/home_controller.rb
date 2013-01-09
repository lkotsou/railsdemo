class HomeController < ApplicationController
  
  layout "site"
  
  def index
    params[:page] ||= "1"
    @posts = Post.order("id DESC").page(params[:page]).per(2)
  end
  
  def login
    user = User.find_by_login_and_password params[:login], params[:password]
    session[:userid] = user.id if user
    redirect_to "/"
  end
  
  def logout
    reset_session
    redirect_to "/"
  end
  
  def sign_up
    user = User.new
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.login = params[:login]
    user.email = params[:email]
    user.password = params[:password]
    user.save
    
    session[:userid] = user.id
    
    redirect_to "/"
    
  end
  
end
