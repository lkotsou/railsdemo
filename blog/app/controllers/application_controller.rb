class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  
  def set_locale
    
    session[:locale] ||= "el"
    if params[:locale]
      I18n.locale = params[:locale]
      session[:locale] = params[:locale]
    else
      I18n.locale = session[:locale]
    end
    
    @user = nil
    @user = User.find session[:userid] if session[:userid]
    
  end
end
