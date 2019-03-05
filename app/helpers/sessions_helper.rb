module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    #ブラウザを表示しているUserのidがsessionに入っているか確認する
  end

  def logged_in?
    !!current_user
  end
end
