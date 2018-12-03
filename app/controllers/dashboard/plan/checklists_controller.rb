class Dashboard::Plan::ChecklistsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    @entry = Checklist.new(checklist_params)
    @entry.event = event

    respond_to do |format|
      if @entry.save
        format.html { redirect_to dashboard_plan_event_url(event), notice: 'Entry has been successfully created.'  }
        # format.html {render partial: '/dashboard/plan/events/checklists', locals: {checklists: event.checklists} }
      else
        format.html { redirect_to dashboard_plan_event_url(event) }
      end
    end
  end

  def destroy
    @entry = Checklist.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_plan_event_url(params[:event_id]), notice: 'Entry was successfully deleted.' }
    end
  end

private
  def checklist_params
    params.require(:checklist).permit(:entry, :description, :event_id)
  end
end
