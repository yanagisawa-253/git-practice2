class ApplicationController < ActionController::Base
  
  before_action :authenticate_customer!,except: [:top, :about,]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resources)
      flash[:notice] = "Welcome!"
      root_path
  end

  def after_sign_up_path_for(resources)
      flash[:notice] = "Welcome!"
      root_path
  end

  def after_sign_out_path_for(resources)
      flash[:notice] = "またのお越しをお待ちしております"
      root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active])
  end
end
