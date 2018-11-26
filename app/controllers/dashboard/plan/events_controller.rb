class Dashboard::Plan::EventsController < ApplicationController
  layout 'main/layout-2'

  def index
    @events = current_user.events

    respond_to do |format|
      format.html { render :index }
      format.json { render json: calendar_json(@events) }
    end

  end

  def create
  end

  def new
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def update
  end

private

  def calendar_json(events)
    calendar_events = []
    @legends = {}
    colorClasses = [ "fc-event-success", "fc-event-info", "fc-event-warning", "fc-event-danger", "fc-event-dark" ];
    event_type_ids = events.map{|event| event.event_type_id}.uniq

    event_type_ids.each_with_index do |id, i|
      if colorClasses[i]
        @legends[id] = colorClasses[i]
      else
        @legends[id] = "no-color"
      end
    end

    events.each do |event|
      e = {title: event.name, start: event.start}

      if event.end
        e[:end] = event.end
      end

      # Assign colorClasses
        e[:className] = @legends[event.id]

      calendar_events.push(e)
    end

    return calendar_events

  end

end
