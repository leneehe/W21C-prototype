class Dashboard::MedicationsController < ApplicationController
  layout 'main/layout-2'

  def index
    @tracked_medications = current_user.tracked_medications.all
  end

  def show
    @medication = current_user.medications.find(params[:id])
    @tracked_medication = current_user.tracked_medications.find_by(medication_id: params[:id])
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
