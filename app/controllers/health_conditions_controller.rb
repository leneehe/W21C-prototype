class HealthConditionsController < ApplicationController
  # Used for health condition info
  layout 'main/layout-2'
  def index
    @user_conditions = current_user.health_conditions
  end
  def show
    @health_condition = HealthCondition.find(params[:id])
    @measurement = TrackedHealthCondition.new
  end
  def new
    @new_user_condition = current_user.health_conditions.build
  end

  def create
    @new_user_condition = current_user.health_conditions.build(health_condition_params)
    # @existing_condition = current_user.health_conditions.find_by()
    respond_to do |format|
      # if @existing_condition
      if @new_user_condition.save
        format.html { redirect_to health_conditions_path, notice: "Item created!" }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end
  def update

  end

private
  def health_condition_params
    params.require(:health_condition).permit(:condition_name, :normal_range_upper, :normal_range_lower, :assistance_threshold)
  end
end

