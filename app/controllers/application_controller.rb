class ApplicationController < ActionController::Base
  # Default layout
  # layout 'main/layout-blank'
  layout :choose_layout

  def choose_layout
    if user_signed_in?
      'main/layout-2'
    else
      'main/layout-blank'
    end
  end
end
