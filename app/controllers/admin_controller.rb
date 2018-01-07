class AdminController < ApplicationController
  before_action :set_locale

  def set_locale 
    I18n.locale = :"zh-TW"
  end
  # def default_url_options(options = {})
    
  # end
end