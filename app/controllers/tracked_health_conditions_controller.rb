class TrackedHealthConditionsController < ApplicationController
  # Used for tracking scores
  layout 'main/layout-2'
  def index
    @user_conditions = current_user.health_conditions
  end
  def show

  end
  def new
    @new_user_condition = current_user.health_conditions.build
  end

  def create

  end
  def edit

  end
  def update

  end
end
