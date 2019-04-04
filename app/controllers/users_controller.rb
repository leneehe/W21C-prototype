class UsersController < ApplicationController
  layout 'main/layout-2'

  before_action :set_user_condition, only: [:show, :save_condition]

  def show

  end

  def save_condition
    if params[:checked]
      # create user's condition
      @user.conditions << Condition.find(params[:condition_id])
    else
      # delete user's condition
      condition_name = @user.conditions.find(params[:condition_id]).name
      @user.conditions.find(params[:condition_id]).delete
      Condition.create(name: condition_name)
    end
  end

  private
  def set_user_condition
    @user = User.find(params[:id])
    @new_user_condition = @user.conditions.build()
  end
end
