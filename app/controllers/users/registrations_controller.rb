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

      #-----Prepopulate User's Symptoms-----
      blood_glucose = Symptom.find_by(
        name: "Blood Glucose")
      blood_glucose.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 11,
        normal_range_lower: 4,
        assistance_threshold: 4,
        unit_of_measure: "mmol/L",
        above_assistance: false
      )

      stress_level = Symptom.find_by(
        name: "Stress Level")
      stress_level.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      mood = Symptom.find_by(
        name: "Mood")
      mood.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      sleep = Symptom.find_by(
        name: "Sleep")
      sleep.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 8,
        normal_range_lower: 7,
        assistance_threshold: 7,
        unit_of_measure: "hours/night",
        above_assistance: false
      )

      loneliness = Symptom.find_by(
        name: "Loneliness")
      loneliness.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      blood_pressure_systolic = Symptom.find_by(
        name: "Blood Pressure Systolic")
      blood_pressure_systolic.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 140,
        normal_range_lower: 120,
        assistance_threshold: 120,
        unit_of_measure: "mmHg",
        above_assistance: false
      )


      blood_pressure_diastolic = Symptom.find_by(
        name: "Blood Pressure Diastolic")
      blood_pressure_diastolic.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 90,
        normal_range_lower: 80,
        assistance_threshold: 80,
        unit_of_measure: "mmHg",
        above_assistance: false
      )

      resting_heart_rate = Symptom.find_by(
        name: "Resting Heart Rate")
      resting_heart_rate.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 100,
        normal_range_lower: 40,
        assistance_threshold: 100,
        unit_of_measure: "BPM",
        above_assistance: true
      )

      tiredness = Symptom.find_by(
        name: "Tiredness/Exhaustion/Energy")
      tiredness.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      edema = Symptom.find_by(
        name: "Edema (Leg/Ankle/Swelling)")
      edema.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      medication_taken = Symptom.find_by(
        name: "Medication Taken")
      medication_taken.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 1, #user 1 & 0 as binary yes/no
        normal_range_lower: 0,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: false
      )

      smoking = Symptom.find_by(
        name: "Smoking")
      smoking.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 30,
        normal_range_lower: 0,
        assistance_threshold: 0,
        unit_of_measure: "cigarettes/day",
        above_assistance: true
      )

      oxygen_therapy = Symptom.find_by(
        name: "Oxygen Therapy")
      oxygen_therapy.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 100,
        normal_range_lower: 0,
        assistance_threshold: 2,
        unit_of_measure: "L/min",
        above_assistance: false
      )

      breath = Symptom.find_by(
        name: "Shortness of Breath")
      breath.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 100,
        normal_range_lower: 95,
        assistance_threshold: 95,
        unit_of_measure: "O2 saturation (%)",
        above_assistance: false
      )

      cough = Symptom.find_by(
        name: "Cough")
      cough.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      wheezing = Symptom.find_by(
        name: "Wheezing")
      wheezing.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      lung_capacity = Symptom.find_by(
        name: "Total Lung Capacity")
      lung_capacity.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 6,
        normal_range_lower: 4,
        assistance_threshold: 4,
        unit_of_measure: "Litres of O2",
        above_assistance: false
      )

      impacted_activities = Symptom.find_by(
        name: "(Asthma) Impacted Activities")
      impacted_activities.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 2, #0 = no, 1 = somewhat, 2 = completely
        normal_range_lower: 1,
        assistance_threshold: 0,
        unit_of_measure: "No, Somewhat, Completely",
        above_assistance: true
      )

      asthma_medication_taken = Symptom.find_by(
        name: "(Asthma) Medication Taken")
      asthma_medication_taken.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 8,
        normal_range_lower: 0,
        assistance_threshold: 1,
        unit_of_measure: "Puffs per Day",
        above_assistance: false
      )

      allergens = Symptom.find_by(
        name: "Allergens or Triggers Present")
      allergens.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 1, # 0 = no, 1 = yes
        normal_range_lower: 0,
        assistance_threshold: 0,
        unit_of_measure: "",
        above_assistance: true
      )

      bmi = Symptom.find_by(
        name: "BMI")
      bmi.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 24.9,
        normal_range_lower: 18.5,
        assistance_threshold: 18.5,
        unit_of_measure: "Weight(kg)/Height(cm)^2",
        above_assistance: false
      )

      dry_hacking_cough = Symptom.find_by(
        name: "Dry Hacking Cough")
      dry_hacking_cough.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      discomfort = Symptom.find_by(
        name: "Discomfort/Swelling in Abdomen")
      discomfort.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      dizziness = Symptom.find_by(
        name: "Dizziness")
      dizziness.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      appetite = Symptom.find_by(
        name: "Appetite")
      appetite.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: false
      )

      nausea = Symptom.find_by(
        name: "Nausea")
      nausea.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      sweatiness = Symptom.find_by(
        name: "Sweatiness/Heat")
      sweatiness.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "",
        above_assistance: true
      )

      social_activities = Symptom.find_by(
        name: "Social Activities")
      social_activities.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: "Activities per week",
        above_assistance: false
      )

      vitamin_d = Symptom.find_by(
        name: "Vitamin D")
      vitamin_d.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 800,
        normal_range_lower: 600,
        assistance_threshold: 600,
        unit_of_measure: "International Units (IU)",
        above_assistance: false
      )

      weight = Symptom.find_by(
        name: "Weight")
      weight.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 180,
        normal_range_lower: 120,
        assistance_threshold: 90,
        unit_of_measure: "lbs"
      )

      pain = Symptom.find_by(
        name: "Pain")
      pain.symptoms_users.create!(
        user_id: user.id,
        normal_range_upper: 10,
        normal_range_lower: 1,
        assistance_threshold: 1,
        unit_of_measure: ""
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
