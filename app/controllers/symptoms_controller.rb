class SymptomsController < ApplicationController
  helper_method :build_data_collection
  # Used for health condition info
  layout 'main/layout-2'
  def index
    @user_conditions = current_user.symptoms
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
    # @measurement = TrackedSymptom.new
    @value_types = @symptom.value_types
    @measurements = []
    @value_types.each do |type|
      # @measurements << @symptom.TrackedSymptom.new(value_type_id: type.id, symptom_id: params[:id])
      @measurements << @symptom.tracked_symptoms.build(value_type_id: type.id)
    end
  end

  def new
    @new_user_symptom = current_user.symptoms.build
  end

  def create
    @new_user_symptom = current_user.symptoms.build(symptom_params)
    # @existing_condition = current_user.symptoms.find_by()
    respond_to do |format|
      # if @existing_condition
      if @new_user_symptom.save
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

  def build_data_collection(condition, unit)
    @value_collection = Array.new
    @value_data = Array.new

     condition.tracked_symptoms.one_week_ago.group_by(&:value_type_id).each do |key, value|
      collection_name =  ValueType.find(key).name
      value.each do |measurement|
        @value_data.push({"x" => measurement.created_at, "y" => measurement.severity_score})  
      end  
      @value_collection.push({ "name" => collection_name, "meta" => collection_name, "data" => @value_data, "unit_of_measure" => unit })
      @value_data = []
    end
    return @value_collection
  end
  

private
  def symptom_params
    params.require(:symptom).permit(:condition_name, :normal_range_upper, :normal_range_lower, :assistance_threshold, :unit_of_measure,
      value_types_attributes:[:id, :name])
  end
end

