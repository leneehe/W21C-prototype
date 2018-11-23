
class TrackedHealthConditionsController < ApplicationController
  # Used for tracking scores
  layout 'main/layout-2'
  def index
    @user_conditions = current_user.health_conditions
  end
  def show

  end
  def new
    # @measurements = []
    # @health_condition = HealthCondition.find(params[:id])
    # @measurement = TrackedHealthCondition.new
    # @value_types = @health_condition.value_types

    # @health_condition = current_user.health_conditions.find(params[:id])
    # @measurement = @health_condition.tracked_health_conditions.build
  end

  def create
    params['measurements'].each do |measurement|
      TrackedHealthCondition.create!(measurement_params(measurement))
    end
    
    # @health_condition = current_user.health_conditions.find(params[:health_condition_id])
    # # @measurement =  TrackedHealthCondition.new(severity_score: params[:severity_score], health_condition_id: params[:health_condition_id])
    # @measurement =  @health_condition.tracked_health_conditions.build(tracked_health_conditions_params)
    # respond_to do |format|
    #   if @measurement.save
    #     format.html { redirect_to health_conditions_path, notice: 'Entry was added' }
    #   else
    #     format.html { redirect_to health_conditions_path }
    #   end
    # end 
  end
  def edit

  end
  def update

  end

  def tracked_health_conditions_params
    params.require(:tracked_health_condition).permit(:health_condition_id, :severity_score, :value_type_id)
  end

  def measurement_params(new_params)
    new_params.permit(:name, :severity_score, :health_condition_id, :value_type_id)
  end
  
  
end
