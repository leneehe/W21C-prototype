class Dashboard::GoalsController < ApplicationController
  layout 'main/layout-2'

  def index
    @goals = current_user.goals.all
  end

  def new
    @goal = current_user.goals.build
  end

  # GET /goals/1
  def show
    @goal = current_user.goals.find(params[:id])
    @goals = current_user.goals.all
  end

  def goal_summary
    @goal = current_user.goals.last
  end

  def create
    @goal = current_user.goals.build(goal_params)

    respond_to do |format|
      # if @existing_condition
      if @goal.save
        format.html { redirect_to dashboard_goal_summary_path, notice: "goal created!" }
      else
        format.html { render :new }
      end
    end

  end

private
  def goal_params
    params.require(:goal).permit(:specific_1, :specific_2, :specific_3, :specific_4, :measurable_1, :measurable_2, :measurable_3, :measurable_4, :attainable_1, :attainable_2, :attainable_3, :attainable_4, :rewarding_1, :rewarding_2, :rewarding_3, :rewarding_4, :timely_1, :timely_2)
  end
end
