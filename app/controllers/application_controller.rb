class ApplicationController < ActionController::Base
  # This tells Devise to run our custom security check before passing data
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permits the username field for both sign up and account updates
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end