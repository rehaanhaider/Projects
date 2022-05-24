
class ApplicationController < ActionController::Base
  include SessionsHelper


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  skip_before_action :verify_authenticity_token


  private
    def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
    end

    def default_url_options
      {locale: I18n.locale}
    end
  
    def set_locale
      I18n.locale = extract_locale || I18n.default_locale
    end
  
    def extract_locale
      parsed_locale = params[:locale]
      I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
        parsed_locale.to_sym :
        nil
    end
end
