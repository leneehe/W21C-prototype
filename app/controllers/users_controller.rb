class UsersController < ApplicationController
  layout 'main/layout-2'
  def show
    @user = User.find(params[:id])
    @new_user_condition = current_user.conditions.build()
  end
end
