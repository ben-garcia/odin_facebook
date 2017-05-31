class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    # You need to implement the method below in you model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, notice: "Signed in!"
    else
      session["devise.user_attributes"] = request.env["omniath.auth"]
      redirect_to new_user_registration_url
    end
  end
  alias_method :facebook, :all
end
