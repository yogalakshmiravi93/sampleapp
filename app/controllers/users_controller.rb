class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
   before_filter :admin_user,     only: :destroy
  def destroy
    user=User.find(params[:id])
    if user.id==1 && user.admin?
      flash[:error]="cannot delete admin"
    else
      User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
  end
    redirect_to users_url
  end
  def show
    @user = User.find(params[:id])
    
  end
  def highscore
    @users=Scorecard.all
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render 'show'
    else
      render 'edit'
    end
  end
  def highscore_veg
     @users=Scorecard.all
  end
def edit
@user = User.find(params[:id])
render 'edit'
flash[:success] = "Profile updated"
sign_in @user
end
def index
    @users = User.paginate(page: params[:page])
  end
  def new
  	@user=User.new
  end
   def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
     flash[:success] = "Sign-up successful...!"
     redirect_to @user
    else
      render 'new'
    end
  end
  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    def correct_user
      @user = User.find(params[:id])
      if !current_user?(@user)
      flash[:error]="Wrong Updation"
      end
      redirect_to(root_url) unless current_user?(@user)
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
