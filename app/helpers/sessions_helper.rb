module SessionsHelper
	def sign_in(user)
  cookies.permanent[:remember_token] = user.remember_token
  flash[:success] = (User.find_by_remember_token(cookies[:remember_token]))[:name]
  self.current_user = user
  end
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  def current_user=(user)
    @current_user = user
  end
   def signed_in?
    !current_user.nil?
  end
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  def current_user?(user)
    user == current_user
  end
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  def update_score_fruit
    
  end
   def update_score_vegetable
    
  end
def delete_session
    session.delete(:questions)
    session.delete(:question)
    session.delete(:current)
    session.delete(:asked)
    session.delete(:score)
  end
  def store_location
    session[:return_to] = request.url
  end
 def update_value
  session[:asked][session[:current]]=session[:question]
end
def update_data
  t=0
  while t <= session[:asked].length do
    session[:questions].delete(session[:asked][t])
    t = t+1
  end
end
end
