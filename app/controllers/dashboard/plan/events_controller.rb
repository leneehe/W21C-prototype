class Dashboard::Plan::EventsController < ApplicationController
  layout 'main/layout-2'

  before_action :set_events_legends, only: [:index, :show]
  before_action :set_event, only: [:show, :destroy]

  def index

    @event = current_user.events.build
    respond_to do |format|
      format.html { render :index }
      format.json { render json: calendar_json(@events) }
    end

  end

  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      # if @existing_condition
      if @event.save
        format.html { redirect_to dashboard_plan_events_url, notice: "Event created!" }
      else
        format.html { render :index }
      end
    end
  end

  def show
    @checklists = @event.checklists
    @entry = Checklist.new
  end


  def update
    event = current_user.events.find(params[:id])
    event.start = params[:start]
    event.end = params[:end]
    event.save
    respond_to do |format|
        format.html { redirect_to dashboard_plan_events_url, notice: "Event saved!" }
        format.json { render json: params }
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_plan_events_url, notice: 'Event was successfully destroyed.' }
    end
  end

private
  def set_event
    @event = current_user.events.find(params[:id])
  end

  def set_events_legends
    @events = current_user.events
    @legends = legend_colors(@events)
  end
  # Assign color class to event types in legend hash
  def legend_colors(events)
    calendar_events = []
    legends = {}

    colorClasses = [ "fc-event-success", "fc-event-info", "fc-event-warning", "fc-event-danger", "fc-event-dark" ];
    event_type_ids = events.map{ |event| event.event_type_id }.uniq

    event_type_ids.each_with_index do |id, i|
      if colorClasses[i]
        legends[id] = colorClasses[i]
      else
        legends[id] = "no-color"
      end
    end

    return legends
  end

  def calendar_json(events)
    calendar_events = []
    legends = legend_colors(events)

    events.each do |event|
      e = {id: event.id, title: event.name, start: event.start}

      if event.end
        e[:end] = event.end
      end

      # Assign colorClasses
      e[:className] = legends[event.event_type_id]


      calendar_events.push(e)
    end

    return calendar_events

  end

  def event_params
    params.require(:event).permit(:name, :start, :end, :frequency, :location, :event_type_id, :user_id)
  end

end
