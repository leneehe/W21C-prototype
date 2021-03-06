class Dashboard::GoalsController < ApplicationController
  layout 'main/layout-2'
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    unless current_user
      redirect_to new_user_session_path, notice: 'you have to sign in first.'
      return
    end
    
    @goals = current_user.goals.incomplete
    @complete_goals = current_user.goals.complete
  end

  def new
    @goal = current_user.goals.build
  end

  # GET /goals/1
  def show
    # show goal number
    goal_ids = []

    if @goal.complete
      goal_ids = current_user.goals.complete.collect{ |g| g.id }
    else
      goal_ids = current_user.goals.incomplete.collect{ |g| g.id }
    end

    goal_ids.each_with_index do |val, index|
      if @goal.id == val
        @goal_number = index + 1
      end
    end
  end

  def goal_summary
    @goal = current_user.goals.last
  end

  def create
    @goal = current_user.goals.build(goal_params)

    respond_to do |format|
      # if @existing_condition
      if @goal.save
        format.html { redirect_to dashboard_goal_summary_url, notice: "goal created!" }
      else
        format.html { render :new }
      end
    end

  end

  def edit

  end

  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to dashboard_goal_url, notice: "Goal updated!" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_goals_url, notice: 'Goal was successfully destroyed.' }
    end
  end

private

# Use callbacks to share common setup or constreaints between actions.
  def set_goal
    @goal = current_user.goals.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:specific_1, :specific_2, :specific_3, :specific_4, :measurable_1, :measurable_2, :measurable_3, :measurable_4, :attainable_1, :attainable_2, :attainable_3, :attainable_4, :rewarding_1, :rewarding_2, :rewarding_3, :rewarding_4, :timely_1, :timely_2, :complete)
  end
end
