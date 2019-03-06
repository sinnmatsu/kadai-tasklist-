class ApplicationController < ActionController::Base
  #ApplicationControllerで定義した
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
      #ログインされていない場合はログインのURLに飛ばす
    end
  end
  
  
  
  
end
