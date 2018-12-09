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
      blood_glucose = user.health_conditions.create!(
        condition_name: "Blood Glucose",
        normal_range_upper: "10",
        normal_range_lower: "20",
        assistance_threshold: "15",
        unit_of_measure: "mmol/L"
      )

      blood_pressure = user.health_conditions.create!(
        condition_name: "Blood Pressure",
        normal_range_upper: "100",
        normal_range_lower: "50",
        assistance_threshold: "70",
        unit_of_measure: "mmHg"
      )

      diastolic = blood_pressure.value_types.create!(name: "Systolic")
      systolic = blood_pressure.value_types.create!(name: "Diastolic")

      molar = blood_glucose.value_types.create!(name: "Molar Concentration")
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
