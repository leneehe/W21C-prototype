class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    dashboard_path
  end
  def after_sign_up_path_for(resource)
    dashboard_path
  end

  def current_page_path?(p)
    request.path.start_with? p
  end

  helper_method :current_page_path?
end
