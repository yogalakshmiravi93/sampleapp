class JumbledController < ApplicationController
	before_filter :signed_in_user, only: [:fruit,:vegetable,:create, :game_over_fruit,:game_over_veg,:new,:addword]
	before_filter :admin_user,     only: [:showall,:destroy,:addword]
	def destroy
    Jumbled.find(params[:id]).destroy
    flash[:success] = "Word destroyed."
    redirect_to url_for(:controller => :jumbled, :action => :showall)
  	end
	def create
		if current_user.admin?
			@jumbled = Jumbled.new(params[:jumbled])
		else
			@jumbled = Newwordstable.new(params[:jumbled])
			@jumbled[:status]=false
		end
		if @jumbled[:category]=='cartoon'
			@jumbled.update_attributes(category:"fruit")
		else
			if @jumbled[:category]=='places & cities'
			@jumbled.update_attributes(category:"vegetable")
		end
	end	
		if @jumbled.save
		redirect_to root_path
		else
			flash[:error]="Invalid entries"
			redirect_to root_path
		end
	end
	def addword
		@jumbled = Newwordstable.paginate(page: params[:page])
	end
  	def showall
  		@jumbled=Jumbled.paginate(page: params[:page])
  	end
	def new
	end
	def welcome
		session[:asked]={}
		all=nil
		session[:questions]=nil
		session[:question]=nil
		session[:current]=0
		session[:score]=0
	end
	def welcome_veg
		session[:asked]={}
		all=nil
		session[:questions]=nil
		session[:question]=nil
		session[:current]=0	
		session[:score]=0	
	end

	def fruit
		@jumbled=Jumbled.new(params[:jumbled])
		if !session[:question].nil?
		if session[:question][:ans]==@jumbled[:ans].upcase
		session[:score]+=1
			flash[:success]="BINGO.... Correct Answer"
		else
			flash[:success]="Sorry...!! Wrong Answer..."
		end
		end
		@all=Jumbled.find_all_by_category('fruit')	
		total=@all.length
		session[:questions] = @all.sort_by{rand}[0..(total-1)]
		if session[:asked].length >= 5 
		redirect_to url_for(:controller => :jumbled, :action => :game_over_fruit)
		else	
		update_data
		session[:question]=session[:questions].first
		update_value
		session[:current]+=1	
		end
		@jumbled=Jumbled.new
	end

	def vegetable
		@jumbled=Jumbled.new(params[:jumbled])
		if !session[:question].nil?
		if session[:question][:ans]==@jumbled[:ans].upcase
		session[:score]+=1
		flash[:success]="BINGO.... Correct Answer"
		else
			flash[:success]="Sorry...!! Wrong Answer..."
		end
		end
		@all=Jumbled.find_all_by_category('vegetable')	
		total=@all.length
		session[:questions] = @all.sort_by{rand}[0..(total-1)]
		if session[:asked].length >= 5
		redirect_to url_for(:controller => :jumbled, :action => :game_over_veg)
		else	
		update_data
		session[:question]=session[:questions].first
		update_value
		session[:current]+=1	
		end
		@jumbled=Jumbled.new
	end
	def game_over_fruit
	if !current_user.scorecard.nil?
	if current_user.scorecard[:fruit]<session[:score]
	@hscore=session[:score]
    current_user.scorecard.update_attributes(fruit: session[:score])
	end
    else
    s=Scorecard.new(fruit:session[:score],vegetable:0)
    s.save
    current_user.scorecard=s
    current_user.save
    end
    @s_user=session[:score]
    session[:score]=0
    delete_session
	end	
	def game_over_veg
	if !current_user.scorecard.nil?
	if current_user.scorecard[:vegetable]<session[:score]
	@hscore=session[:score]
    current_user.scorecard.update_attributes(vegetable: session[:score])
    end
    else
    s=Scorecard.new(fruit:0,vegetable:session[:score])
    s.save
    current_user.scorecard=s
    current_user.save
    end
    @s_user=session[:score]
    session[:score]=0
    delete_session
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

