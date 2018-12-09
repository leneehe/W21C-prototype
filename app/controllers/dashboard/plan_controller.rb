class Dashboard::PlanController < ApplicationController
  layout 'main/layout-2'

  def index
    @goals = current_user.goals
    @events = current_user.events.order(start: :desc).limit(5)
  end

  def checklists
    @entries = current_user.checklists.order('created_at DESC')
  end

end
