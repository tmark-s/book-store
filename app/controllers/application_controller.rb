class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:dateofbirth])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
      devise_parameter_sanitizer.permit(:account_update, keys: [:firstname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:lastname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:dateofbirth])
      devise_parameter_sanitizer.permit(:account_update, keys: [:address])
    end
end
