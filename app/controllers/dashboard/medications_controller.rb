class Dashboard::MedicationsController < ApplicationController
  layout 'main/layout-2'
    before_action :set_medication, only: [:show, :edit, :update, :destroy]

  def index
    @tracked_medications = current_user.tracked_medications
  end

  def show

    @tracked_medication = current_user.tracked_medications.find_by(medication_id: params[:id])
  end

  def new
    @medications = Medication.all.map{|m| m.name}.to_json
    @medication = current_user.medications.build
    @tracked_medication = @medication.tracked_medications.build
  end

  def create
    @medication = current_user.medications.build(medication_params)

    respond_to do |format|
      if @medication.save
        format.html { redirect_to dashboard_medications_url, notice: "New Medication added"}
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update

    respond_to do |format|
      if @medication.update(medication_params)
        format.html { redirect_to dashboard_medication_url, notice: "Medication updated!" }
      else
        format.html { render :edit }
      end
    end

  end

  def destroy
    @medication.destroy
    @medication.tracked_medications.destroy_all
    respond_to do |format|
      format.html { redirect_to dashboard_medications_url, notice: 'Medication was successfully destroyed.' }
    end
  end

private

  def set_medication
    @medication = current_user.medications.find(params[:id])
  end

  def medication_params
    params.require(:medication).except(:mednames).permit(:name, :rx_photograph_link, :link, :strength, :description, :instruction, :condition_cure,
    tracked_medications_attributes: [:id,
      :prescribed_by, :special_instruction, :dosage, :frequency, :user_id, :medication_id, :_destroy
      ])
  end
end
