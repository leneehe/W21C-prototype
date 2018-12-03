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

# User Seeds
user1 = User.create(email: "lena@lena.com", password: "password", first_name: "Lena", last_name: "H", gender: "Female", date_of_birth: Date.new(1990,10,24) )

user2 = User.create(email: "dog@dog.com", password: "password", first_name: "Dog", last_name: "Kat", gender: "Male", date_of_birth: Date.new(1995,2,3) )


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
    systolic.tracked_health_conditions.create!(severity_score: y*2 , health_condition_id: blood_pressure.id)
  end
end

# Create some Medications
Medication.create(name: "Generic: Levothyroxine, Brand: Synthroid", strength: "112 mcg", description: "Pink oblong tablet", instruction: "1 tablet by mouth every day", condition_cure: "Thyroid")

# User's Medications
user2.tracked_medications.create(prescribed_by: "Dr. Smith", special_instruction: "Take in the morning an empty stomach", dosage: "1 tablet", frequency: "Daily", medication_id: 1)

# Create Event Types
EventType.create(name: "Appointment")
EventType.create(name: "Medication")
EventType.create(name: "Personal")
EventType.create(name: "Reminder")

# User's Events
user2.events.create!(name: "Dr. Duddz checkup", start: DateTime.now - 5.days, event_type_id: 1, frequency: "once", location: "Clinic")
event2 = user2.events.create!(name: "Start new medicine x", start: DateTime.now - 3.days, event_type_id: 2, frequency: "once")
user2.events.create!(name: "Sleep monitoring", start: DateTime.now - 1.days - (2/24.0), end: DateTime.now - 1.days + (30/1440.0) , event_type_id: 3, frequency: "weekly")
user2.events.create!(name: "Do yoga", start: DateTime.now - 2.days, end: DateTime.now - 1.days, event_type_id: 4, frequency: "daily", location: "World gym")

# Create Checklists for Event
event2.checklists.create!(entry: "Buy Antivirus", description: "OTC label xx2xx34 from Rexall")
event2.checklists.create!(entry: "Order Products", complete: true)
event2.checklists.create!(entry: "Jane's Happy Anniversary", description: "Her 57'th anniversary @ St.Mary Hospital")

# ------- Time Tip --------!
# hours = 10
# minutes = 5
# seconds = 64
#
# hours = DateTime.now - (hours/24.0) #<DateTime: 2015-03-11T07:27:17+02:00 ((2457093j,19637s,608393383n),+7200s,2299161j)>
# minutes = DateTime.now - (minutes/1440.0) #<DateTime: 2015-03-11T17:22:17+02:00 ((2457093j,55337s,614303598n),+7200s,2299161j)>
# seconds = DateTime.now - (seconds/86400.0) #<DateTime: 2015-03-11T17:26:14+02:00 ((2457093j,55574s,785701811n),+7200s,2299161j)>
