class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action do
    I18n.locale = params[:locale] || session[:language] ||extract_locale_from_accept_language_header
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def extract_locale_from_accept_language_header
    case request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    when 'en-US'
      'en'
    when 'pt'
      'pt-BR'
    when 'pt-BR'
      'pt-BR'
    else
      'en'
    end
  end

end
