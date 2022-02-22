class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    private
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :admin
      admin_path
    else
      items_path
    end
  end

  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      new_customer_session_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :tel])
  end
end
