class ApplicationController < ActionController::Base

  protect_from_forgery unless: -> { request.format.json? }

  def after_sign_in_path_for(resource)
    dashboard_plan_path
  end
  def after_sign_up_path_for(resource)
    dashboard_plan_path
  end

  def current_page_path?(p)
    request.path.start_with? p
  end

  helper_method :current_page_path?
end
