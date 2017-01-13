class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist



#Working with session variables, only when someone comes from target links, the output for which
#can be seen in the application.html.erb file which is located in views/layouts/HERE
#**********
  before_action :set_source

  def set_source
    session[:source] = params[:q] if params[:q]
  end
#**************


  def current_user
    super
  end

end
