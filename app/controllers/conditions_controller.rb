class ConditionsController < ApplicationController
  def new
    @new_condition = Condition.new
  end

  def create
    # params[:name].titlize
    condition = current_user.conditions.build(condition_params)
    found_condition = Condition.find_by("lower(name) = ?", condition.name.downcase)

    respond_to do |format|
      if (found_condition)
        current_user.conditions << found_condition
        format.html { redirect_to user_url(current_user.id) }
      else
        if condition.save!
          current_user.conditions << condition
          format.html { redirect_to user_url(current_user.id) }
        end
      end
    end
  end

  def condition_params
    params.require(:condition).permit(:name)
  end
end
