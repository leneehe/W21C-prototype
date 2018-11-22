class Dashboard::MedicationsController < ApplicationController
  layout 'main/layout-2'

  def index
    @tracked_medications = current_user.tracked_medications.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
