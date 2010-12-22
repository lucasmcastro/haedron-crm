class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_user!
  layout :specify_layout

  protected 

    def specify_layout
      controller_name == 'sessions' ? 'login' : 'application' 
    end  
end
