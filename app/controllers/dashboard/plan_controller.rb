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
    @events = current_user.events
    @legends = legend_colors(@events)
    @goals = current_user.goals.incomplete
    respond_to do |format|
      format.html { render :report }
      format.json { render json: calendar_json(@events) }
    end
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
end
