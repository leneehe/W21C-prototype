class Dashboard::PlanController < ApplicationController
  helper_method :build_data_collection
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
    @user_conditions = current_user.health_conditions

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

  def build_data_collection(condition, unit)
    @value_collection = Array.new
    @value_data = Array.new

     condition.tracked_health_conditions.one_week_ago.group_by(&:value_type_id).each do |key, value|
      collection_name =  ValueType.find(key).name
      value.each do |measurement|
        @value_data.push({"x" => measurement.created_at, "y" => measurement.severity_score})  
      end  
      @value_collection.push({ "name" => collection_name, "meta" => collection_name, "data" => @value_data, "unit_of_measure" => unit })
      @value_data = []
    end
    return @value_collection
  end

end
