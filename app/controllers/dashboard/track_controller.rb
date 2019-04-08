class Dashboard::TrackController < ApplicationController
  layout 'main/layout-2'

  def checklists
    @entries = current_user.checklists.order('created_at DESC')
  end
end
