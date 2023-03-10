class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end
  
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def authenticate_user
    if @current_user == nil
       redirect_to new_user_session_path
    end
  end
  
  
  protected
  
  def configure_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
  
end
