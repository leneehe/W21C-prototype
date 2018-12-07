class Dashboard::PlanController < ApplicationController
  layout 'main/layout-2'

  def index
  end

  def checklists
    @entries = current_user.checklists.order('created_at DESC')
  end

end
