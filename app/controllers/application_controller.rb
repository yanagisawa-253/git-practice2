class ApplicationController < ActionController::Base

  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?




  def after_sign_in_path_for(resources)
      flash[:notice] = "Welcome! You have signed in successfully."
      user_path(current_user.id)
  end

  def after_sign_up_path_for(resources)
      flash[:notice] = "Welcome! You have signed up successfully."
      user_path(current_user.id)
  end

  def after_sign_out_path_for(resources)
      flash[:notice] = "Signed out successfully."
      root_path
  end


  protected

  def configure_permitted_parameters
    if resource_class == User
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
       devise_parameter_sanitizer.permit(:account_update, keys: [:name,:email])
    end
  end
end
