
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
    # params['measurements'].each do |measurement|
    #   if measurement['severity_score'].present?
    #     TrackedSymptom.create!(measurement_params(measurement))
    #   end
    # end
    # respond_to do |format|
    #     format.html { redirect_to symptoms_path, notice: 'Entry was added' }
    # end 
    
    @symptom = current_user.symptoms.find(params[:symptom_id])
    @measurement = TrackedSymptom.new(params[:tracked_symptom])
    # @measurement =  @symptom.tracked_symptoms.build(tracked_symptoms_params)
    respond_to do |format|
      if @measurement.save!
        format.html { redirect_to symptoms_path, notice: 'Entry was added' }
      else
        format.html { redirect_to symptoms_path }
      end
    end 
  end

  def edit

  end
  def update

  end

  def measurement_params(new_params)
    new_params.permit(:severity_score, :symptom_id)
  end
  
  
end
