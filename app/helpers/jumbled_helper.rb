module JumbledHelper

def update_value
	session[:asked][session[:current]]=session[:question]
	session[:current]+=1
end

end
