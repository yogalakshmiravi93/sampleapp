class SessionsController < ApplicationController
  def create
   user = User.find_by_email(params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])  
    sign_in user
    redirect_back_or user
  else
    flash[:error] = 'Invalid email/password combination' # Not quite right!
    render 'new'
  end
  end
  def destroy
    delete_session
    sign_out
    flash[:success] = "You have successfully signed out"
    redirect_to root_path
  end
end