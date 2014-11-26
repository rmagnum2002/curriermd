class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :catch_not_found
  before_filter :set_locale_filter
  before_filter :load_settings


  def load_settings
    @settings = AppSetting.first_or_create
  end

  def set_locale_filter
    if cookies[:lang] && LOCALES.keys.include?(cookies[:lang])
      @locale = cookies[:lang]
    end

    @locale ||= "ro"

    if cookies[:lang] != @locale
      cookies[:lang] = {:value => @locale, :expires => 1.year.from_now}
    end

    I18n.locale = LOCALES[@locale]
    true
  end

  helper_method :current_language

  def current_language
    language = cookies[:lang]
    language = params[:locale] if params[:locale]
    language
  end

  def load_search_bar
    @search = Article.search(params[:search])
  end

private

  def set_admin_locale
    I18n.locale = :fr
  end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :flash => { :notice => "Wrong URL" }
  end
end
