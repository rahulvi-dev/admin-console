class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
  #   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
  #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  # end

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      admin_home_path
    else 
      users_path(current_user)
    end
  end

  def after_sign_out_path_for(resource)
   if resource == :user
      users_sign_in_path
    else 
      admins_sign_in_path 
    end
  end

protected

    def layout_by_resource
      if devise_controller? && resource_name == :admin
        "admin"
      else
        "application"
      end
    end
end
