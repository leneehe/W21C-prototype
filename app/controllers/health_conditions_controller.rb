class HealthConditionsController < ApplicationController
  # Used for health condition info
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
    @new_user_condition = current_user.health_conditions.build(health_condtion_params)
    @new_user_condition.save
  end
  def edit

  end
  def update

  end

private
  def recipe_params
    params.require(:recipe).permit(:recipe_category_id, :strain_id, :title, :image, :remove_image,:remote_image_url,:video, :description, :prep_time, :views, :user_id, instructions_attributes:[:id, :recipe_id ,:step, :_destroy],
      allergies_attributes:[:id, :name],
      measurements_attributes:[:id, :ingredient_id, :recipe_id, :quantity, :_destroy,
      ingredient_attributes:[:id, :name, :concentrate_recipe_id, :_destroy]])
  end
  def health_condition_params
    params.require(:health_condition).permit(:condition_name, :normal_range_upper, :normal_range_lower, :assistance_threshold)
  end
end

