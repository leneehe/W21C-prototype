# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#----User seeds-----
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

user1 = User.create(email: "lena@lena.com", password: "password", first_name: "Lena", last_name: "H", gender: "Female", date_of_birth: Date.new(1990,10,24) )

user2 = User.create(email: "dog@dog.com", password: "password", first_name: "Dog", last_name: "Kat", gender: "Male", date_of_birth: Date.new(1995,2,3) )

#-----Prepopulate Conditions-----
diabetes1 = Condition.create!(name:"Diabetes (Type 1)")
diabetes2 = Condition.create!(name:"Diabetes (Type 2)")
hypertension = Condition.create!(name:"Hypertension")
congestive = Condition.create!(name:"Congestive Obstructive Pulmonary Disease")
congestive = Condition.create!(name:"Congestive Obstructive Pulmonary Disease")
asthma = Condition.create!(name:"Asthma")
heart_failure = Condition.create!(name:"Heart Failiure")
ischemic = Condition.create!(name:"Ischemic Heart Disease")
mental_health = Condition.create!(name:"Mental Health")
obesity = Condition.create!(name:"Obesity")

#-----Prepopulate Symptoms-----
blood_glucose = Symptom.create!(
  name: "Blood Glucose",
  normal_range_upper: 11,
  normal_range_lower: 4,
  assistance_threshold: 4,
  unit_of_measure: "mmol/L"
)

stress_level = Symptom.create!(
  name: "Stress Level",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
mood = Symptom.create!(
  name: "Mood",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
sleep = Symptom.create!(
  name: "Sleep",
  normal_range_upper: 8,
  normal_range_lower: 7,
  assistance_threshold: 7,
  unit_of_measure: "hours/night"
)
loneliness = Symptom.create!(
  name: "Loneliness",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)

blood_pressure_systolic = Symptom.create!(
  name: "Blood Pressure Systolic",
  normal_range_upper: 140,
  normal_range_lower: 120,
  assistance_threshold: 120,
  unit_of_measure: "mmHg"
)
blood_pressure_diastolic = Symptom.create!(
  name: "Blood Pressure Diastolic",
  normal_range_upper: 90,
  normal_range_lower: 80,
  assistance_threshold: 80,
  unit_of_measure: "mmHg"
)

resting_heart_rate = Symptom.create!(
  name: "Resting Heart Rate",
  normal_range_upper: 100,
  normal_range_lower: 40,
  assistance_threshold: 100,
  unit_of_measure: "BPM"
)

tiredness = Symptom.create!(
  name: "Tiredness/Exhaustion/Energy",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
edema = Symptom.create!(
  name: "Edema (Leg/Ankle/Swelling)",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
medication_taken = Symptom.create!(
  name: "Medication Taken",
  normal_range_upper: 1, #user 1 & 0 as binary yes/no
  normal_range_lower: 0,
  assistance_threshold: 1,
  unit_of_measure: ""
)
smoking = Symptom.create!(
  name: "Smoking",
  normal_range_upper: 30, #user 1 & 0 as binary yes/no
  normal_range_lower: 0,
  assistance_threshold: 1,
  unit_of_measure: "cigarettes/day"
)
oxygen_therapy = Symptom.create!(
  name: "Oxygen Therapy",
  normal_range_upper: 100,
  normal_range_lower: 0,
  assistance_threshold: 100,
  unit_of_measure: "L/min"
)
breath = Symptom.create!(
  name: "Shortness of Breath",
  normal_range_upper: 100,
  normal_range_lower: 95,
  assistance_threshold: 95,
  unit_of_measure: "O2 saturation (%)"
)
cough = Symptom.create!(
  name: "Cough",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
wheezing = Symptom.create!(
  name: "Wheezing",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
lung_capacity = Symptom.create!(
  name: "Total Lung Capacity",
  normal_range_upper: 4,
  normal_range_lower: 6,
  assistance_threshold: 4,
  unit_of_measure: "Litres of O2"
)
impacted_activities = Symptom.create!(
  name: "(Asthma) Impacted Activities",
  normal_range_upper: 2, #0 = no, 1 = somewhat, 2 = completely
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "No, Somewhat, Completely"
)
asthma_medication_taken = Symptom.create!(
  name: "(Asthma) Medication Taken",
  normal_range_upper: 8,
  normal_range_lower: 0,
  assistance_threshold: 1,
  unit_of_measure: "Puffs per Day"
)
allergens = Symptom.create!(
  name: "Allergens or Triggers Present",
  normal_range_upper: 1, # 0 = no, 1 = yes
  normal_range_lower: 0,
  assistance_threshold: 1,
  unit_of_measure: ""
)
bmi = Symptom.create!(
  name: "BMI",
  normal_range_upper: 24.9,
  normal_range_lower: 18.5,
  assistance_threshold: 18.5,
  unit_of_measure: "Weight(kg)/Height(cm)^2"
)
dry_hacking_cough = Symptom.create!(
  name: "Dry Hacking Cough",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
discomfort = Symptom.create!(
  name: "Discomfort/Swelling in Abdomen",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
dizziness = Symptom.create!(
  name: "Dizziness",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
appetite = Symptom.create!(
  name: "Appetite",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
nausea = Symptom.create!(
  name: "Nausea",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
sweatiness = Symptom.create!(
  name: "Sweatiness/Heat",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: ""
)
social_activities = Symptom.create!(
  name: "Social Activities",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "Activities per week"
)
vitamin_d = Symptom.create!(
  name: "Vitamin D",
  normal_range_upper: 800,
  normal_range_lower: 600,
  assistance_threshold: 600,
  unit_of_measure: "International Units (IU)"
)

# ------ Suggested Symptoms for conditions ------
diabetes1.suggested_symptoms.create!(
  symptom_id: blood_glucose.id, primary_condition: true
)
diabetes1.suggested_symptoms.create!(
  symptom_id: stress_level.id, primary_condition: false
)
diabetes1.suggested_symptoms.create!(
  symptom_id: mood.id, primary_condition: false
)
diabetes1.suggested_symptoms.create!(
  symptom_id: sleep.id, primary_condition: false
)
diabetes1.suggested_symptoms.create!(
  symptom_id: loneliness.id, primary_condition: false
)

diabetes2.suggested_symptoms.create!(
  symptom_id: blood_glucose.id, primary_condition: true
)
diabetes2.suggested_symptoms.create!(
  symptom_id: stress_level.id, primary_condition: false
)
diabetes2.suggested_symptoms.create!(
  symptom_id: mood.id, primary_condition: false
)
diabetes2.suggested_symptoms.create!(
  symptom_id: sleep.id, primary_condition: false
)
diabetes2.suggested_symptoms.create!(
  symptom_id: loneliness.id, primary_condition: false
)

hypertension.suggested_symptoms.create!(
  symptom_id: blood_pressure_systolic.id, primary_condition: true
)
hypertension.suggested_symptoms.create!(
  symptom_id: blood_pressure_diastolic.id, primary_condition: true
)
hypertension.suggested_symptoms.create!(
  symptom_id: stress_level.id, primary_condition: false
)
hypertension.suggested_symptoms.create!(
  symptom_id: mood.id, primary_condition: false
)
hypertension.suggested_symptoms.create!(
  symptom_id: sleep.id, primary_condition: false
)

congestive.suggested_symptoms.create!(
  symptom_id: medication_taken.id, primary_condition: true
)
congestive.suggested_symptoms.create!(
  symptom_id: smoking.id, primary_condition: false
)
congestive.suggested_symptoms.create!(
  symptom_id: oxygen_therapy.id, primary_condition: false
)
congestive.suggested_symptoms.create!(
  symptom_id: breath.id, primary_condition: false
)
congestive.suggested_symptoms.create!(
  symptom_id: cough.id, primary_condition: false
)
congestive.suggested_symptoms.create!(
  symptom_id: wheezing.id, primary_condition: false
)

asthma.suggested_symptoms.create!(
  symptom_id: lung_capacity.id, primary_condition: true
)
asthma.suggested_symptoms.create!(
  symptom_id: mood.id, primary_condition: false
)
asthma.suggested_symptoms.create!(
  symptom_id: sleep.id, primary_condition: false
)
asthma.suggested_symptoms.create!(
  symptom_id: stress_level.id, primary_condition: false
)
asthma.suggested_symptoms.create!(
  symptom_id: breath.id, primary_condition: false
)
asthma.suggested_symptoms.create!(
  symptom_id: impacted_activities.id, primary_condition: false
)

weight = heart_failure.symptoms.create!(
  name: "Weight", normal_range_upper: 180, normal_range_lower: 120, assistance_threshold: 90, unit_of_measure: "lbs"
)
heart_failure.suggested_symptoms.create!(
  symptom_id: breath.id, primary_condition: false
)
heart_failure.suggested_symptoms.create!(
  symptom_id: dry_hacking_cough.id, primary_condition: false
)
heart_failure.suggested_symptoms.create!(
  symptom_id: discomfort.id, primary_condition: false
)
heart_failure.suggested_symptoms.create!(
  symptom_id: sleep.id, primary_condition: false
)
heart_failure.suggested_symptoms.create!(
  symptom_id: dizziness.id, primary_condition: false
)
heart_failure.suggested_symptoms.create!(
  symptom_id: appetite.id, primary_condition: false
)

ischemic.symptoms.create!(
  name: "Pain", normal_range_upper: 10, normal_range_lower: 1, assistance_threshold: 1, unit_of_measure: ""
)
ischemic.suggested_symptoms.create!(
  symptom_id: breath.id, primary_condition: false
)
ischemic.suggested_symptoms.create!(
  symptom_id: tiredness.id, primary_condition: false
)
ischemic.suggested_symptoms.create!(
  symptom_id: dizziness.id, primary_condition: false
)
ischemic.suggested_symptoms.create!(
  symptom_id: nausea.id, primary_condition: false
)
ischemic.suggested_symptoms.create!(
  symptom_id: sweatiness.id, primary_condition: false
)

mental_health.suggested_symptoms.create!(
  symptom_id: mood.id, primary_condition: true
)
mental_health.suggested_symptoms.create!(
  symptom_id: stress_level.id, primary_condition: false
)
mental_health.suggested_symptoms.create!(
  symptom_id: sleep.id, primary_condition: false
)
mental_health.suggested_symptoms.create!(
  symptom_id: social_activities.id, primary_condition: false
)
mental_health.suggested_symptoms.create!(
  symptom_id: vitamin_d.id, primary_condition: false
)
mental_health.suggested_symptoms.create!(
  symptom_id: loneliness.id, primary_condition: false
)

obesity.suggested_symptoms.create!(
  symptom_id: weight.id, primary_condition: true
)
obesity.suggested_symptoms.create!(
  symptom_id: stress_level.id, primary_condition: false
)
obesity.suggested_symptoms.create!(
  symptom_id: sleep.id, primary_condition: false
)
obesity.suggested_symptoms.create!(
  symptom_id: mood.id, primary_condition: false
)
obesity.suggested_symptoms.create!(
  symptom_id: loneliness.id, primary_condition: false
)


#-----User's symptoms seeds-----
(1..5).each do |x|
  user.tracked_symptoms.create!(severity_score: x * 2 + 120 , symptom_id: blood_pressure_systolic.id)
  user.tracked_symptoms.create!(severity_score: x*2 , symptom_id: blood_glucose.id)
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
