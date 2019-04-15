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

      user.event_types.create!(name: "Appointment")
      user.event_types.create!(name: "Medication")
      user.event_types.create!(name: "Personal")
      user.event_types.create!(name: "Reminder")

      blood_glucose = user.symptoms.create!(
        name: "Blood Glucose"
      )
      blood_glucose.symptoms_users.update(
        normal_range_upper: 11,
        normal_range_lower: 4,
        assistance_threshold: 4,
        unit_of_measure: "mmol/L",
        above_assistance: false
      )

      stress_level = user.symptoms.create!(
        name: "Stress Level"
      )
      stress_level.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      mood = user.symptoms.create!(
        name: "Mood"
      )
      mood.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      sleep = user.symptoms.create!(
        name: "Sleep"
      )
      sleep.symptoms_users.update(
        normal_range_upper: 8,
        normal_range_lower: 7,
        assistance_threshold: 7,
        unit_of_measure: "hours/night",
        above_assistance: false
      )

      loneliness = user.symptoms.create!(
        name: "Loneliness"
      )
      loneliness.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      blood_pressure_systolic = user.symptoms.create!(
        name: "Blood Pressure Systolic"
      )
      blood_pressure_systolic.symptoms_users.update(
        normal_range_upper: 140,
        normal_range_lower: 120,
        assistance_threshold: 120,
        unit_of_measure: "mmHg",
        above_assistance: false
      )


      blood_pressure_diastolic = user.symptoms.create!(
        name: "Blood Pressure Diastolic"
      )
      blood_pressure_diastolic.symptoms_users.update(
        normal_range_upper: 90,
        normal_range_lower: 80,
        assistance_threshold: 80,
        unit_of_measure: "mmHg",
        above_assistance: false
      )

      resting_heart_rate = user.symptoms.create!(
        name: "Resting Heart Rate"
      )
      resting_heart_rate.symptoms_users.update(
        normal_range_upper: 100,
        normal_range_lower: 40,
        assistance_threshold: 100,
        unit_of_measure: "BPM",
        above_assistance: true
      )

      tiredness = user.symptoms.create!(
        name: "Tiredness/Exhaustion/Energy"
      )
      tiredness.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      edema = user.symptoms.create!(
        name: "Edema (Leg/Ankle/Swelling)"
      )
      edema.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      medication_taken = user.symptoms.create!(
        name: "Medication Taken"
      )
      medication_taken.symptoms_users.update(
        normal_range_upper: 1, #user 1 & 0 as binary yes/no
        normal_range_lower: 0,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: false
      )

      smoking = user.symptoms.create!(
        name: "Smoking"
      )
      smoking.symptoms_users.update(
        normal_range_upper: 30,
        normal_range_lower: 0,
        assistance_threshold: 0,
        unit_of_measure: "cigarettes/day",
        above_assistance: true
      )

      oxygen_therapy = user.symptoms.create!(
        name: "Oxygen Therapy"
      )
      oxygen_therapy.symptoms_users.update(
        normal_range_upper: 100,
        normal_range_lower: 0,
        assistance_threshold: 2,
        unit_of_measure: "L/min",
        above_assistance: false
      )

      breath = user.symptoms.create!(
        name: "Shortness of Breath"
      )
      breath.symptoms_users.update(
        normal_range_upper: 100,
        normal_range_lower: 95,
        assistance_threshold: 95,
        unit_of_measure: "O2 saturation (%)",
        above_assistance: false
      )

      cough = user.symptoms.create!(
        name: "Cough"
      )
      cough.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      wheezing = user.symptoms.create!(
        name: "Wheezing"
      )
      wheezing.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      lung_capacity = user.symptoms.create!(
        name: "Total Lung Capacity"
      )
      lung_capacity.symptoms_users.update(
        normal_range_upper: 6,
        normal_range_lower: 4,
        assistance_threshold: 4,
        unit_of_measure: "Litres of O2",
        above_assistance: false
      )

      impacted_activities = user.symptoms.create!(
        name: "(Asthma) Impacted Activities"
      )
      impacted_activities.symptoms_users.update(
        normal_range_upper: 2, #0 = no, 1 = somewhat, 2 = completely
        normal_range_lower: 1,
        assistance_threshold: 0,
        unit_of_measure: "No, Somewhat, Completely",
        above_assistance: true
      )

      asthma_medication_taken = user.symptoms.create!(
        name: "(Asthma) Medication Taken"
      )
      asthma_medication_taken.symptoms_users.update(
        normal_range_upper: 8,
        normal_range_lower: 0,
        assistance_threshold: 1,
        unit_of_measure: "Puffs per Day",
        above_assistance: false
      )

      allergens = user.symptoms.create!(
        name: "Allergens or Triggers Present"
      )
      allergens.symptoms_users.update(
        normal_range_upper: 1, # 0 = no, 1 = yes
        normal_range_lower: 0,
        assistance_threshold: 0,
        unit_of_measure: "",
        above_assistance: true
      )

      bmi = user.symptoms.create!(
        name: "BMI"
      )
      bmi.symptoms_users.update(
        normal_range_upper: 24.9,
        normal_range_lower: 18.5,
        assistance_threshold: 18.5,
        unit_of_measure: "Weight(kg)/Height(cm)^2",
        above_assistance: false
      )

      dry_hacking_cough = user.symptoms.create!(
        name: "Dry Hacking Cough"
      )
      dry_hacking_cough.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      discomfort = user.symptoms.create!(
        name: "Discomfort/Swelling in Abdomen"
      )
      discomfort.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      dizziness = user.symptoms.create!(
        name: "Dizziness"
      )
      dizziness.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      appetite = user.symptoms.create!(
        name: "Appetite"
      )
      appetite.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: false
      )

      nausea = user.symptoms.create!(
        name: "Nausea"
      )
      nausea.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      sweatiness = user.symptoms.create!(
        name: "Sweatiness/Heat"
      )
      sweatiness.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      social_activities = user.symptoms.create!(
        name: "Social Activities"
      )
      social_activities.symptoms_users.update(
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "Activities per week",
        above_assistance: false
      )

      vitamin_d = user.symptoms.create!(
        name: "Vitamin D"
      )
      vitamin_d.symptoms_users.update(
        normal_range_upper: 800,
        normal_range_lower: 600,
        assistance_threshold: 600,
        unit_of_measure: "International Units (IU)",
        above_assistance: false
      )

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
