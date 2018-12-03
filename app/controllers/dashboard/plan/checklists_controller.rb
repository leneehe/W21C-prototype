class Dashboard::Plan::ChecklistsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    @entry = Checklist.new(checklist_params)
    @entry.event = event

    respond_to do |format|
      if @entry.save
        format.html { redirect_to dashboard_plan_event_url(event) }
        # format.html {render partial: '/dashboard/plan/events/checklists', locals: {checklists: event.checklists} }
      else
        redirect_to dashboard_plan_event_url(event)
      end
    end
  end

  def destroy
  end

private
  def checklist_params
    params.require(:checklist).permit(:entry, :description, :event_id)
  end
end
