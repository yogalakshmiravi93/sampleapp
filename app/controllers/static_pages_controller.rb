class StaticPagesController < ApplicationController
  def home
	 respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @users }
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
