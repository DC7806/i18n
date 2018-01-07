class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
 
  def default_url_options(options = {})
    { locale: I18n.locale }
  end

  private
  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end
  def set_locale
    if params[:locale]
      I18n.locale = normalize_locale(params[:locale])
    elsif params[:locale].blank?
      I18n.locale = extract_locale_from_accept_language_header
    else
      I18n.default_locale
    end
  end
 
  def extract_locale_from_accept_language_header
    case request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    when 'zh'
      :"zh-TW"
    else
      :en
    end
  end

  def normalize_locale(locale)
    case locale
    when 'zh-TW'
      :"zh-TW"
    else
      :en
    end
  end
end
