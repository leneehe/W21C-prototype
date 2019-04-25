class SymptomsController < ApplicationController
  helper_method :build_data_collection
  # Used for health condition info
  layout 'main/layout-2'
  before_action :set_suggested_symptoms, only: [:index]

  def index
    @user_symptoms = current_user.symptoms

    # Grab all conditions
    # For each condition, list all symptoms and place them in an array
    # Filter/uniq the symptoms
    @severity_scores = Array.new
    # test pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{current_user.first_name}_report",
        page_size: 'A4',
        disposition: 'inline',
        template: "symptoms/index.html.erb",
        layout: "layouts/pdf.html.erb"
      end
    end
    # # test pdf
  end

  def show
    @symptom = Symptom.find(params[:id])
    @tracked_symptom = current_user.tracked_symptoms.build
    # @measurement = TrackedSymptom.new
    # @value_types = @symptom.value_types
    # @measurements = []
    # @value_types.each do |type|
    #   @measurements << @symptom.tracked_symptoms.build(value_type_id: type.id)
    # end
  end

  def new
    user_conditions = current_user.conditions
      @primary_symptoms = []
      @supporting_symptoms = []
      user_conditions.each do |condition|
        @primary_symptoms << condition.symptoms.primary
        @supporting_symptoms << condition.symptoms.supporting
      end
    if user_conditions != []
      @primary_symptoms.flatten!.uniq!
      @supporting_symptoms.flatten!.uniq!
    end
    @new_user_symptom = current_user.symptoms.build
    # build join table to allow accepts_nested_attributes_for
    @new_user_symptom.symptoms_users.build
  end

  def create
    @new_user_symptom = current_user.symptoms.build(name: symptom_params[:name])
    # Check if symptom already exists based on name
    @existing_condition = Symptom.where("lower(name) = ?", symptom_params[:name].downcase).first

    @new_user_symptom = @existing_condition ? @existing_condition : @new_user_symptom

    respond_to do |format|
      if @new_user_symptom.save
        symptom_info = SymptomsUser.create(user_id: current_user.id, symptom_id: @new_user_symptom.id)
        symptom_info.update(symptom_params[:symptoms_users_attributes]["0"])

        format.html { redirect_to symptoms_path, notice: "Item created!" }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end
  def update

  end

  def build_data_collection(symptom, unit, symptom_info)
    @value_collection = Array.new
    @value_data = Array.new

    symptom.tracked_symptoms.one_week_ago.each do |measurement|
      # collection_name =  ValueType.find(key).name
        @value_data.push({"x" => measurement.created_at, "y" => measurement.severity_score})
    end

    @value_collection.push({ 
      "name" => symptom.name,
      "meta" => symptom.name,
      "data" => @value_data,
      "unit_of_measure" => unit,
      "assistance_threshold" =>  symptom_info.assistance_threshold,
      "above_assistance" => symptom_info.above_assistance
    })

    return @value_collection
  end


private
  def set_suggested_symptoms
    user_conditions = current_user.conditions
    @user_symptoms = current_user.symptoms
    user_conditions.each do |condition|
      @user_symptoms << condition.symptoms
    end
    # @user_symptoms.flatten!.uniq!
  end

  def symptom_params
    # params.require(:symptom).permit(:name, :normal_range_upper, :normal_range_lower, :assistance_threshold, :unit_of_measure, :above_assistance)
    params.require(:symptom).permit(:name,
      symptoms_users_attributes: [:normal_range_upper, :normal_range_lower, :assistance_threshold, :unit_of_measure, :above_assistance])
  end
end
