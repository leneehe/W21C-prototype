class Dashboard::Plan::EventsController < ApplicationController
  layout 'main/layout-2'

  def index
    @events = current_user.events
    @legends = legend_colors(@events)

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
    @event = current_user.events.find(params[:id])
  end

  def edit
  end

  def update
    # api get json find the event object
    # respond_to do |format|
    #   format.json { render json: }
    # end
  end

  def destroy
  end

private
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
