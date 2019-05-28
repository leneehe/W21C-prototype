# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout 'main/layout-blank'
  before_action :configure_sign_up_params, only: [:create, :update]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create

    super do |user|
      if user.save

      user.event_types.create!(name: "Appointment")
      user.event_types.create!(name: "Medication")
      user.event_types.create!(name: "Personal")
      user.event_types.create!(name: "Reminder")

      #-----Conditions-----

      heart_failure = Condition.find_by(name:"Heart Failiure")
      ischemic = Condition.find_by(name:"Ischemic Heart Disease")

      #-----Prepopulate Symptoms-----
      blood_glucose = Symptom.create!(
        name: "Blood Glucose", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 11,
        normal_range_lower: 4,
        assistance_threshold: 4,
        unit_of_measure: "mmol/L",
        above_assistance: false]
      )

      stress_level = Symptom.create!(
        name: "Stress Level", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      ])

      mood = Symptom.create!(
        name: "Mood", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      sleep = Symptom.create!(
        name: "Sleep", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 8,
        normal_range_lower: 7,
        assistance_threshold: 7,
        unit_of_measure: "hours/night",
        above_assistance: false]
      )

      loneliness = Symptom.create!(
        name: "Loneliness", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      blood_pressure_systolic = Symptom.create!(
        name: "Blood Pressure Systolic", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 140,
        normal_range_lower: 120,
        assistance_threshold: 120,
        unit_of_measure: "mmHg",
        above_assistance: false]
      )


      blood_pressure_diastolic = Symptom.create!(
        name: "Blood Pressure Diastolic", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 90,
        normal_range_lower: 80,
        assistance_threshold: 80,
        unit_of_measure: "mmHg",
        above_assistance: false]
      )

      resting_heart_rate = Symptom.create!(
        name: "Resting Heart Rate", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 100,
        normal_range_lower: 40,
        assistance_threshold: 100,
        unit_of_measure: "BPM",
        above_assistance: true]
      )

      tiredness = Symptom.create!(
        name: "Tiredness/Exhaustion/Energy", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      edema = Symptom.create!(
        name: "Edema (Leg/Ankle/Swelling)", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      medication_taken = Symptom.create!(
        name: "Medication Taken", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 1, #user 1 & 0 as binary yes/no
        normal_range_lower: 0,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: false]
      )

      smoking = Symptom.create!(
        name: "Smoking", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 30,
        normal_range_lower: 0,
        assistance_threshold: 0,
        unit_of_measure: "cigarettes/day",
        above_assistance: true]
      )

      oxygen_therapy = Symptom.create!(
        name: "Oxygen Therapy", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 100,
        normal_range_lower: 0,
        assistance_threshold: 2,
        unit_of_measure: "L/min",
        above_assistance: false]
      )

      breath = Symptom.create!(
        name: "Shortness of Breath", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 100,
        normal_range_lower: 95,
        assistance_threshold: 95,
        unit_of_measure: "O2 saturation (%)",
        above_assistance: false]
      )

      cough = Symptom.create!(
        name: "Cough", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      wheezing = Symptom.create!(
        name: "Wheezing", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      lung_capacity = Symptom.create!(
        name: "Total Lung Capacity", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 6,
        normal_range_lower: 4,
        assistance_threshold: 4,
        unit_of_measure: "Litres of O2",
        above_assistance: false]
      )

      impacted_activities = Symptom.create!(
        name: "(Asthma) Impacted Activities", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 2, #0 = no, 1 = somewhat, 2 = completely
        normal_range_lower: 1,
        assistance_threshold: 0,
        unit_of_measure: "No, Somewhat, Completely",
        above_assistance: true]
      )

      asthma_medication_taken = Symptom.create!(
        name: "(Asthma) Medication Taken", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 8,
        normal_range_lower: 0,
        assistance_threshold: 1,
        unit_of_measure: "Puffs per Day",
        above_assistance: false]
      )

      allergens = Symptom.create!(
        name: "Allergens or Triggers Present", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 1, # 0 = no, 1 = yes
        normal_range_lower: 0,
        assistance_threshold: 0,
        unit_of_measure: "",
        above_assistance: true]
      )

      bmi = Symptom.create!(
        name: "BMI", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 24.9,
        normal_range_lower: 18.5,
        assistance_threshold: 18.5,
        unit_of_measure: "Weight(kg)/Height(cm)^2",
        above_assistance: false]
      )

      dry_hacking_cough = Symptom.create!(
        name: "Dry Hacking Cough", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      discomfort = Symptom.create!(
        name: "Discomfort/Swelling in Abdomen", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      dizziness = Symptom.create!(
        name: "Dizziness", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      appetite = Symptom.create!(
        name: "Appetite", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: false]
      )

      nausea = Symptom.create!(
        name: "Nausea", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      sweatiness = Symptom.create!(
        name: "Sweatiness/Heat", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true]
      )

      social_activities = Symptom.create!(
        name: "Social Activities", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "Activities per week",
        above_assistance: false]
      )

      vitamin_d = Symptom.create!(
        name: "Vitamin D", symptoms_users_attributes: [user_id: user.id,
        normal_range_upper: 800,
        normal_range_lower: 600,
        assistance_threshold: 600,
        unit_of_measure: "International Units (IU)",
        above_assistance: false]
      )

      weight = heart_failure.symptoms.create!(
        name: "Weight",
        symptoms_users_attributes: [
        normal_range_upper: 180, normal_range_lower: 120, assistance_threshold: 90, unit_of_measure: "lbs", user_id: user.id]
      )

      pain = ischemic.symptoms.create!(
        name: "Pain", symptoms_users_attributes: [
         normal_range_upper: 10, normal_range_lower: 1, assistance_threshold: 1, unit_of_measure: "", user_id: user.id]
      )

      end
    end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :gender, :date_of_birth])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :gender, :date_of_birth])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
