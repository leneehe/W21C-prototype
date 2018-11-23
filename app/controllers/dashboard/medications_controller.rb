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
    @medications = Medication.all.map{|m| m.name}.to_json
    @medication = current_user.medications.build
  end

  def create
    @medication = current_user.medications.build(medication_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def medication_params
    params.require(:medication).permit(:name, :rx_photograph_link, :link, :strength, :description, :instruction, :condition_cure,
    tracked_medications_attributes: [:id,
      :prescribed_by, :special_instruction, :dosage, :frequency, :medication_id, :_destroy
      ])
  end
end
