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
asthma = Condition.create!(name:"Asthma")
heart_failure = Condition.create!(name:"Heart Failiure")
ischemic = Condition.create!(name:"Ischemic Heart Disease")
mental_health = Condition.create!(name:"Mental Health")
obesity = Condition.create!(name:"Obesity")

#-----Prepopulate Symptoms-----
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
  name: "Weight"
)
weight.symptoms_users.update(
  normal_range_upper: 180, normal_range_lower: 120, assistance_threshold: 90, unit_of_measure: "lbs", user_id: user.id
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

pain = ischemic.symptoms.create!(
  name: "Pain"
)
pain.symptoms_users.update(
   normal_range_upper: 10, normal_range_lower: 1, assistance_threshold: 1, unit_of_measure: "", user_id: user.id
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
user1.events.create!(name: "Dr. Duddz checkup", start: DateTime.now - 5.days, event_type_id: 1, frequency: "once", location: "Clinic")
event1 = user1.events.create!(name: "Start new medicine x", start: DateTime.now - 3.days, event_type_id: 2, frequency: "once")
user1.events.create!(name: "Sleep monitoring", start: DateTime.now - 1.days - (2/24.0), end: DateTime.now - 1.days + (30/1440.0) , event_type_id: 3, frequency: "weekly")
user1.events.create!(name: "Do yoga", start: DateTime.now - 2.days, end: DateTime.now - 1.days, event_type_id: 4, frequency: "daily", location: "World gym")

user2.events.create!(name: "Dr. Duddz checkup", start: DateTime.now - 5.days, event_type_id: 1, frequency: "once", location: "Clinic")
event2 = user2.events.create!(name: "Start new medicine x", start: DateTime.now - 3.days, event_type_id: 2, frequency: "once")
user2.events.create!(name: "Sleep monitoring", start: DateTime.now - 1.days - (2/24.0), end: DateTime.now - 1.days + (30/1440.0) , event_type_id: 3, frequency: "weekly")
user2.events.create!(name: "Do yoga", start: DateTime.now - 2.days, end: DateTime.now - 1.days, event_type_id: 4, frequency: "daily", location: "World gym")

user.events.create!(name: "Dr. Duddz checkup", start: DateTime.now - 5.days, event_type_id: 1, frequency: "once", location: "Clinic")
event3 = user.events.create!(name: "Start new medicine x", start: DateTime.now - 3.days, event_type_id: 2, frequency: "once")
user.events.create!(name: "Sleep monitoring", start: DateTime.now - 1.days - (2/24.0), end: DateTime.now - 1.days + (30/1440.0) , event_type_id: 3, frequency: "weekly")
user.events.create!(name: "Do yoga", start: DateTime.now - 2.days, end: DateTime.now - 1.days, event_type_id: 4, frequency: "daily", location: "World gym")

# Create Checklists for Event
event1.checklists.create!(entry: "Buy Antivirus", description: "OTC label xx2xx34 from Rexall")
event1.checklists.create!(entry: "Order Products", complete: true)
event1.checklists.create!(entry: "Jane's Happy Anniversary", description: "Her 57'th anniversary @ St.Mary Hospital")
event2.checklists.create!(entry: "Buy Antivirus", description: "OTC label xx2xx34 from Rexall")
event2.checklists.create!(entry: "Order Products", complete: true)
event2.checklists.create!(entry: "Jane's Happy Anniversary", description: "Her 57'th anniversary @ St.Mary Hospital")
event3.checklists.create!(entry: "Buy Antivirus", description: "OTC label xx2xx34 from Rexall")
event3.checklists.create!(entry: "Order Products", complete: true)
event3.checklists.create!(entry: "Jane's Happy Anniversary", description: "Her 57'th anniversary @ St.Mary Hospital")

# ------- Time Tip --------!
# hours = 10
# minutes = 5
# seconds = 64
#
# hours = DateTime.now - (hours/24.0) #<DateTime: 2015-03-11T07:27:17+02:00 ((2457093j,19637s,608393383n),+7200s,2299161j)>
# minutes = DateTime.now - (minutes/1440.0) #<DateTime: 2015-03-11T17:22:17+02:00 ((2457093j,55337s,614303598n),+7200s,2299161j)>
# seconds = DateTime.now - (seconds/86400.0) #<DateTime: 2015-03-11T17:26:14+02:00 ((2457093j,55574s,785701811n),+7200s,2299161j)>
