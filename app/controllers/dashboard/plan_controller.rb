class Dashboard::PlanController < ApplicationController
  layout 'main/layout-2'

  def index
    @goals = current_user.goals
    @events = current_user.events.order(start: :desc).limit(5)
  end

  def checklists
    @entries = current_user.checklists.order('created_at DESC')
  end

  def report
    @user = current_user
  end

  def display_report
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{current_user.first_name}_report",
        page_size: 'A4',
        disposition: 'inline',
        template: "dashboard/plan/display_report.html.erb",
        layout: "layouts/pdf.html.erb"
      end
    end
  end

end
