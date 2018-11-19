# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
    :first_name => "cat",
    :last_name => "meow",
    :email => "cat@cat.com",
    :gender => "female",
    :admin => true,
    :date_of_birth => DateTime.new(1995,10,10,10),
    :password => "123456",
    :password_confirmation => "123456"
)

user.save!

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

blood_mercury = user.health_conditions.create!(
  condition_name: "Blood Mercury",
  normal_range_upper: "20",
  normal_range_lower: "5",
  assistance_threshold: "30",
  unit_of_measure: "ng/mL"
)

diastolic = blood_pressure.value_types.create!(name: "Systolic")
systolic = blood_pressure.value_types.create!(name: "Diastolic")

molar = blood_glucose.value_types.create!(name: "Molar Concentration")

(1..5).each do |x|
  blood_pressure.value_types.length.times do |y|
    diastolic.tracked_health_conditions.create!(severity_score: y , health_condition_id: blood_pressure.id)
    systolic.tracked_health_conditions.create!(severity_score: y*1.2 , health_condition_id: blood_pressure.id)
  end
end
