class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	 before_action :authenticate_user!, except: [:top, :new]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  def after_sign_in_path_for(resource)
      user_path(current_user.id)
  end
end
