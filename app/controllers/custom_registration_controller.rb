class CustomRegistrationController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
      # UsersMailer.welcome_email(@user).deliver_now
    end
  end
end
