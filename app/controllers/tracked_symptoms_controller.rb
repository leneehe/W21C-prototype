
class TrackedSymptomsController < ApplicationController
  # Used for tracking scores
  layout 'main/layout-2'
  def index
    @user_conditions = current_user.symptoms
  end
  def show

  end
  def new
    # @measurements = []
    # @symptom = Symptom.find(params[:id])
    # @measurement = TrackedSymptom.new
    # @value_types = @symptom.value_types

    # @symptom = current_user.symptoms.find(params[:id])
    # @measurement = @symptom.tracked_symptoms.build
  end

  def create

    @symptom = current_user.symptoms.find(params[:symptom_id])
    @measurement = TrackedSymptom.new(measurement_params)
    # @measurement =  @symptom.tracked_symptoms.build(tracked_symptoms_params)
    respond_to do |format|
      if @measurement.save!
        format.html { redirect_to symptoms_path(anchor: @symptom.name), notice: 'Entry was added' }
      else
        format.html { redirect_to symptoms_path }
      end
    end
  end

  def edit

  end
  def update

  end


  def measurement_params
    params.require(:tracked_symptom).permit(:severity_score, :symptom_id, :user_id)
  end
end
