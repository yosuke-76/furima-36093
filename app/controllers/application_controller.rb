class ApplicationController < ActionController::Base
  before_action :configre_permit_parameters, if: :devise_controller?

  private
  def configre_permit_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
end
