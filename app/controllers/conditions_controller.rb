class ConditionsController < ApplicationController
  def new
    @new_condition = Condition.new
  end

  def create
    @condition = current_user.conditions.build(condition_params)
    respond_to do |format|
      if @condition.save!
        current_user.conditions << @condition
        format.html { redirect_to user_url(current_user.id) }
      end
    end
  end

  def condition_params
    params.require(:condition).permit(:name)
  end
end
