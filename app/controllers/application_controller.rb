class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configre_permit_parameters, if: :devise_controller?

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  def configre_permit_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
end
