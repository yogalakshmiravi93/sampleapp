class NewwordstableController < ApplicationController
  before_filter :admin_user
	def destroy
    Newwordstable.find(params[:id]).destroy
    flash[:success] = "Word destroyed."
    redirect_to url_for(:controller => :jumbled, :action => :addword)
  	end
  	def save      
  		@word=Newwordstable.find_by_ans(params[:ans])
  		if @word[:category]=='cartoon'
			@word.update_attributes(category:"fruit")
		else
			if @word[:category]=='places & cities'
			@word.update_attributes(category:"vegetable")
			end
		end
		    @j=Jumbled.new(category:@word[:category],ans:@word[:ans],hint:@word[:hint])
  			@j.save
        Newwordstable.delete(@word)
  			redirect_to url_for(:controller => :jumbled, :action => :addword)
  	end
  	def saveall
  		@words=Newwordstable.all
  		if @words.length>0
  		@words.each do |w|
  			if w[:category]=='cartoon'
			w.update_attributes(category:"fruit")
			else
			if w[:category]=='places & cities'
			w.update_attributes(category:"vegetable")
			end
		end
  		@j=Jumbled.new(category:w[:category],ans:w[:ans],hint:w[:hint])
  		Newwordstable.delete(w)
  		@j.save
  		end
  	end
  		redirect_to url_for(:controller => :jumbled, :action => :addword)
  	end

private
    def signed_in_user
      unless signed_in?
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    def admin_user
      if !signed_in?
        redirect_to signin_url, notice: "Please sign in."
      else
      redirect_to(root_url) unless current_user.admin?
      end
    end
end