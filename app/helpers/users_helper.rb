module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  def sign_in(user)
  cookies.permanent[:remember_token] = user.remember_token
  flash[:success] = "Welcome!"
  self.current_user = user
  end
end
