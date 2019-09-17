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
blood_glucose = Symptom.create!(
  name: "Blood Glucose", normal_range_upper: 11,
  normal_range_lower: 4,
  assistance_threshold: 4,
  unit_of_measure: "mmol/L",
  above_assistance: false,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 11,
  normal_range_lower: 4,
  assistance_threshold: 4,
  unit_of_measure: "mmol/L",
  above_assistance: false]
)

stress_level = Symptom.create!(
  name: "Stress Level", normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true
])

mood = Symptom.create!(
  name: "Mood", normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

sleep = Symptom.create!(
  name: "Sleep", normal_range_upper: 8,
  normal_range_lower: 7,
  assistance_threshold: 7,
  unit_of_measure: "hours/night",
  above_assistance: false,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 8,
  normal_range_lower: 7,
  assistance_threshold: 7,
  unit_of_measure: "hours/night",
  above_assistance: false]
)

loneliness = Symptom.create!(
  name: "Loneliness", normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

blood_pressure_systolic = Symptom.create!(
  name: "Blood Pressure Systolic",
  normal_range_upper: 120,
  normal_range_lower: 90,
  assistance_threshold: 140,
  unit_of_measure: "mmHg",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 120,
  normal_range_lower: 90,
  assistance_threshold: 140,
  unit_of_measure: "mmHg",
  above_assistance: true]
)


blood_pressure_diastolic = Symptom.create!(
  name: "Blood Pressure Diastolic",
  normal_range_upper: 80,
  normal_range_lower: 60,
  assistance_threshold: 90,
  unit_of_measure: "mmHg",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 80,
  normal_range_lower: 60,
  assistance_threshold: 90,
  unit_of_measure: "mmHg",
  above_assistance: true]
)

resting_heart_rate = Symptom.create!(
  name: "Resting Heart Rate",
  normal_range_upper: 100,
  normal_range_lower: 40,
  assistance_threshold: 100,
  unit_of_measure: "BPM",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 100,
  normal_range_lower: 40,
  assistance_threshold: 100,
  unit_of_measure: "BPM",
  above_assistance: true]
)

tiredness = Symptom.create!(
  name: "Tiredness/Exhaustion/Energy",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

edema = Symptom.create!(
  name: "Edema (Leg/Ankle/Swelling)",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

medication_taken = Symptom.create!(
  name: "Medication Taken",
  normal_range_upper: 1, #user 1 & 0 as binary yes/no
  normal_range_lower: 0,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: false,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 1, #user 1 & 0 as binary yes/no
  normal_range_lower: 0,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: false]
)

smoking = Symptom.create!(
  name: "Smoking",
  normal_range_upper: 30,
  normal_range_lower: 0,
  assistance_threshold: 0,
  unit_of_measure: "cigarettes/day",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 30,
  normal_range_lower: 0,
  assistance_threshold: 0,
  unit_of_measure: "cigarettes/day",
  above_assistance: true]
)

oxygen_therapy = Symptom.create!(
  name: "Oxygen Therapy", normal_range_upper: 100,
  normal_range_lower: 0,
  assistance_threshold: 2,
  unit_of_measure: "L/min",
  above_assistance: false,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 100,
  normal_range_lower: 0,
  assistance_threshold: 2,
  unit_of_measure: "L/min",
  above_assistance: false]
)

breath = Symptom.create!(
  name: "Shortness of Breath", normal_range_upper: 100,
  normal_range_lower: 95,
  assistance_threshold: 95,
  unit_of_measure: "O2 saturation (%)",
  above_assistance: false,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 100,
  normal_range_lower: 95,
  assistance_threshold: 95,
  unit_of_measure: "O2 saturation (%)",
  above_assistance: false]
)

cough = Symptom.create!(
  name: "Cough", normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

wheezing = Symptom.create!(
  name: "Wheezing",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

lung_capacity = Symptom.create!(
  name: "Total Lung Capacity",
  normal_range_upper: 6,
  normal_range_lower: 4,
  assistance_threshold: 4,
  unit_of_measure: "Litres of O2",
  above_assistance: false,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 6,
  normal_range_lower: 4,
  assistance_threshold: 4,
  unit_of_measure: "Litres of O2",
  above_assistance: false]
)

impacted_activities = Symptom.create!(
  name: "(Asthma) Impacted Activities",
  normal_range_upper: 2, #0 = no, 1 = somewhat, 2 = completely
  normal_range_lower: 1,
  assistance_threshold: 0,
  unit_of_measure: "No, Somewhat, Completely",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 2, #0 = no, 1 = somewhat, 2 = completely
  normal_range_lower: 1,
  assistance_threshold: 0,
  unit_of_measure: "No, Somewhat, Completely",
  above_assistance: true]
)

asthma_medication_taken = Symptom.create!(
  name: "(Asthma) Medication Taken",
  normal_range_upper: 8,
  normal_range_lower: 0,
  assistance_threshold: 1,
  unit_of_measure: "Puffs per Day",
  above_assistance: false,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 8,
  normal_range_lower: 0,
  assistance_threshold: 1,
  unit_of_measure: "Puffs per Day",
  above_assistance: false]
)

allergens = Symptom.create!(
  name: "Allergens or Triggers Present",
  normal_range_upper: 1, # 0 = no, 1 = yes
  normal_range_lower: 0,
  assistance_threshold: 0,
  unit_of_measure: "",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 1, # 0 = no, 1 = yes
  normal_range_lower: 0,
  assistance_threshold: 0,
  unit_of_measure: "",
  above_assistance: true]
)

bmi = Symptom.create!(
  name: "BMI",
  normal_range_upper: 24.9,
  normal_range_lower: 18.5,
  assistance_threshold: 18.5,
  unit_of_measure: "Weight(kg)/Height(cm)^2",
  above_assistance: false,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 24.9,
  normal_range_lower: 18.5,
  assistance_threshold: 18.5,
  unit_of_measure: "Weight(kg)/Height(cm)^2",
  above_assistance: false]
)

dry_hacking_cough = Symptom.create!(
  name: "Dry Hacking Cough",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

discomfort = Symptom.create!(
  name: "Discomfort/Swelling in Abdomen",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
   symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

dizziness = Symptom.create!(
  name: "Dizziness",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

appetite = Symptom.create!(
  name: "Appetite",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: false,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: false]
)

nausea = Symptom.create!(
  name: "Nausea",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

sweatiness = Symptom.create!(
  name: "Sweatiness/Heat",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "",
  above_assistance: true]
)

social_activities = Symptom.create!(
  name: "Social Activities",
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "Activities per week",
  above_assistance: false,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 10,
  normal_range_lower: 1,
  assistance_threshold: 1,
  unit_of_measure: "Activities per week",
  above_assistance: false]
)

vitamin_d = Symptom.create!(
  name: "Vitamin D",
  normal_range_upper: 800,
  normal_range_lower: 600,
  assistance_threshold: 600,
  unit_of_measure: "International Units (IU)",
  above_assistance: false,
    symptoms_users_attributes: [user_id: user.id,
  normal_range_upper: 800,
  normal_range_lower: 600,
  assistance_threshold: 600,
  unit_of_measure: "International Units (IU)",
  above_assistance: false]
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
  name: "Weight",
  symptoms_users_attributes: [
  normal_range_upper: 180, normal_range_lower: 120, assistance_threshold: 90, unit_of_measure: "lbs", user_id: user.id]
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
  name: "Pain", symptoms_users_attributes: [
   normal_range_upper: 10, normal_range_lower: 1, assistance_threshold: 1, unit_of_measure: "", user_id: user.id]
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

Resource.create!(title: "COPD (Chronic obstructive pulmonary disease) Overview",
            description: "Chronic obstructive pulmonary disease (COPD) refers to two lung diseases: emphysema and chronic bronchitis.",
             content_page: %{<p>Chronic obstructive pulmonary disease (COPD) refers to two lung diseases: emphysema and chronic bronchitis. Even though
              COPD cannot be cured, the right treatment can help you feel better and live longer. Consider ways to avoid cigarette
              smoke and air pollution, get regular exercise, and eat a balanced diet.</p>
              <p>People with COPD often have shortness of breath, coughing, wheezing, and chest tightness. It’s important to talk to your
              doctor if you have any of these symptoms.</p>
              <div class="space-30"></div>
              <h3>References:</h3>
              <p>COPD Foundation. What is COPD? Website: <a href="https://www.copdfoundation.org/What-is-COPD/Understanding-COPD/What-is-COPD.aspx" target="_blank">https://www.copdfoundation.org/What-is-COPD/Understanding-COPD/What-is-COPD.aspx</a>. Accessed 2018 Oct 05.</p>
              <p>MyHealth.Alberta.ca. COPD (Chronic Obstructive Pulmonary Disease) Overview. Website:<a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw32559&#hw32561" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw32559&#hw32561</a>.
                Accessed 2018 Oct 05.</p>})
Resource.create!(title: "High Blood Pressure Overview",
  description: "High blood pressure is also known as hypertension. High blood pressure is unique, because it doesn’t often cause obvious
              symptoms.",
              content_page: %{<p>High blood pressure is also known as hypertension. High blood pressure is unique, because it doesn’t often cause obvious
              symptoms. You may have found out you have high blood pressure after you visited the doctor for a different reason.
              Doctors don’t always know the exact cause of high blood pressure.</p>
              <p>If you do have high blood pressure, your doctor will work with you to manage it. Lifestyle changes are usually very
              effective in treating high blood pressure. Some people may also need to take medication. High blood pressure left
              uncontrolled can damage your blood vessels and other organs.</p>
              <p>There are ways to prevent high blood pressure. Making lifestyle changes can help. By staying at a healthy weight,
              exercising regularly, and cutting back on alcohol, you can help prevent or reverse high blood pressure.</p>
              <div class="space-30"></div>
              <h3>For more information, visit MyHealth.Alberta.ca:</h3>
              <p>Link: <a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw62787" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw62787</a></p>
              <div class="space-30"></div>
              <h3>References:</h3>
              <p>MyHealth.Alberta.ca. High Blood Pressure – Topic Overview.
                <a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw62787" target="_blank">
                  https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw62787</a>
                  . Accessed 2018 Oct 11.</p>})
Resource.create!(title: "Type 1 Diabetes Overview",
  description: "Type 1 diabetes is a disease that happens if your pancreas does not make a hormone called insulin.",
              content_page: %{<p>Type 1 diabetes is a disease that happens if your pancreas does not make a hormone called insulin. Most of the time,
              people with Type 1 diabetes were born with it. In any case, without insulin, your body cannot properly control its blood
              sugar levels. Sugar is produced by your body or taken in through food. If sugar builds up in your body, it can be
              harmful to your body and put you at risk for other illnesses. In the short-term, you could become confused, lethargic,
              or even unconscious.</p>
              <p>Common symptoms of type 1 diabetes include high thirst levels, urinating frequently, or losing weight without trying. If
              you notice any of these symptoms, visit your doctor right away.</p>
              <div class="space-30"></div>
              <h3>For more information, visit MyHealth.Alberta.ca:</h3>
              <p>Link: <a href="https://myhealth.alberta.ca/Health/Pages/conditions.aspx?hwid=hw34303&#hw34305" target="_blank">https://myhealth.alberta.ca/Health/Pages/conditions.aspx?hwid=hw34303&#hw34305</a></p>
              <div class="space-30"></div>
              <h3>Resources:</h3>
              <p>Diabetes Canada. Living with type 1 diabetes. Website:
                <a href="https://www.diabetes.ca/diabetes-and-you/living-with-type-1-diabetes" target="_blank">
                  https://www.diabetes.ca/diabetes-and-you/living-with-type-1-diabetes
                </a>
                  . Accessed 2018 Oct 11.
              </p>
              <p>MyHealth.Alberta.ca. Type 1 Diabetes – Topic Overview. Website:
                <a href="https://myhealth.alberta.ca/Health/Pages/conditions.aspx?hwid=hw34303&#hw34305" target="_blank">
                  https://myhealth.alberta.ca/Health/Pages/conditions.aspx?hwid=hw34303&#hw34305
                </a>
                . Accessed 2018 Oct 11.
              </p>})
Resource.create!(title: "Type 2 Diabetes Overview",
  description: "Type 2 diabetes is different from type 1 diabetes. In type 1 diabetes, your body can’t produce insulin at all. In type 2 diabetes, your body produces some insulin, but doesn’t use it correctly.",
              content_page: %{<p>Type 2 diabetes is different from type 1 diabetes. In type 1 diabetes, your body can’t produce insulin at all. In type 2
              diabetes, your body produces some insulin, but doesn’t use it correctly. The most important part about managing type 2
              diabetes is keeping your blood sugar levels in your target range. If you have type 2 diabetes, your doctor will work
              with you to make a plan. Eating a balanced diet, exercising regularly, staying at a healthy weight, and taking medicine
              – if needed – all help control blood sugar.</p>
              <p>If you think you may be at risk for type 2 diabetes, speak to your doctor.</p>
              <div class="space-30"></div>
              <h3>For more information, visit MyHealth.Alberta.ca:</h3>
              <p>Link: <a href="https://myhealth.alberta.ca/Health/Pages/conditions.aspx?hwid=hw135189&#hw135192" target="_blank">https://myhealth.alberta.ca/Health/Pages/conditions.aspx?hwid=hw135189&#hw135192</a></p>
              <div class="space-30"></div>
              <h3>References:</h3>
              <p>MyHealth.Alberta.ca. Type 2 Diabetes – Overview. Website:
                <a href="https://myhealth.alberta.ca/Health/Pages/conditions.aspx?hwid=hw135189&#hw135192" target="_blank">
                  https://myhealth.alberta.ca/Health/Pages/conditions.aspx?hwid=hw135189&#hw135192
                </a>
                  . Accessed 2018 Oct 11.
              </p>})
Resource.create!(title: "Chronic Kidney Disease Overview",
  description: "Chronic kidney disease (CKD) happens when your kidneys are damaged over many years.",
  content_page: %{<p>Chronic kidney disease (CKD) happens when your kidneys are damaged over many years. For example, uncontrolled high blood
              pressure or blood glucose eventually damages your kidneys. Your kidneys could be failing for more than 30 years before
              you start having symptoms. Symptoms include urinating less than normal, puffiness, weight gain, and lethargy, or losing
              weight without trying. Treating CKD starts with treating the problem that is causing kidney damage. Lifestyle changes
              and medication also help treat kidney disease. Your doctor will work with you to create a unique plan.</p>
              <p>If you experience any of the symptoms listed, see your doctor.</p>
              <div class="space-30"></div>
              <h3>For more information, visit MyHealth.Alberta.ca:</h3>
              <p>Link: <a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=aa65427" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=aa65427</a></p>
              <div class="space-30"></div>
              <h3>References:</h3>
              <p>MyHealth.Alberta.ca. Chronic Kidney Disease – Topic Overview. Website:
                <a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=aa65427" target="_blank">
                  https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=aa65427
                </a>
                  . Accessed 2018 Oct 11.
              </p>})
Resource.create!(title: "Helping Myself - Mental Health",
  description: "Mental health issues are more common than you might think, because they can be quite invisible to those around you.",
  content_page: %{<p>Mental health issues are more common than you might think, because they can be quite invisible to those around you. Lots
              of people struggle with illnesses like depression, anxiety, and bipolar disorder, and there are a variety of ways to
              treat each of these illnesses. If you struggle with mental health, know that you are not alone, it is not your fault,
              and that there are resources available to help you.</p>
              <p>If you struggle with mental health, treating the problem will make it easier to manage the rest of your chronic
              illnesses, since the issues you face there won’t seem as big. It will also make it easier to reach your other goals,
              like eating a healthy diet, getting more exercise, or spending time with family.</p>
              <div class="space-30"></div>
              <h3>AHS Addiction and Mental Health Resources:</h3>
              <p><a href="https://www.albertahealthservices.ca/amh/amh.aspx" target="_blank">https://www.albertahealthservices.ca/amh/amh.aspx</a></p>
              <div class="space-30"></div>
              <h3>Other Resources:</h3>
              <p><a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=center1028" target="_blank">
                  https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=center1028
                </a>
              </p>
              <p><a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=aa79756" target="_blank">
                  https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=aa79756
                </a>
              </p>
              <p><a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=ad1040spec" target="_blank">
                  https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=ad1040spec
                </a>
              </p>
              <p><a href="https://myhealth.alberta.ca/health/AfterCareInformation/pages/conditions.aspx?hwid=ut3330" target="_blank">
                  https://myhealth.alberta.ca/health/AfterCareInformation/pages/conditions.aspx?hwid=ut3330
                </a>
              </p>
              <p><a href="https://myhealth.alberta.ca/health/AfterCareInformation/pages/conditions.aspx?hwid=abk6308" target="_blank">
                  https://myhealth.alberta.ca/health/AfterCareInformation/pages/conditions.aspx?hwid=abk6308
                </a>
              </p>
              <p><a href="https://myhealth.alberta.ca/health/AfterCareInformation/pages/conditions.aspx?hwid=abk6226" target="_blank">
                  https://myhealth.alberta.ca/health/AfterCareInformation/pages/conditions.aspx?hwid=abk6226
                </a>
              </p>})
Resource.create!(title: "Stress Management",
  description: "Stress is what you feel when you suddenly have to deal with more than you are used to dealing with.",
  content_page: %{<p>Stress is what you feel when you suddenly have to deal with more than you are used to dealing with. Some stress is
              normal and at times, even helpful if you need to react fast or work hard for something. Too much stress at once or
              stress that lasts too long can be harmful, causing things like stomach upsets, headaches, pain, or sleep problems.</p>
              <p>For many people with chronic conditions, especially when newly diagnosed, all the extra appointments, medications,
              treatments, self-tracking, new medical words, or changes to your environment, daily activities, or habits, can be
              stressful. And unlike the flu, which you know will go away, a chronic illness is different – it may never go away and
              can disrupt your life in many ways, which can be quite stressful. If not managed, this stress can lead to frustration,
              anger, feelings of hopelessness, and at times, depression. Finding ways to manage the stress will help you cope with the
              changes and impacts of living with chronic health needs, and help you live a more positive life.</p>
              <p>The good news is that you can do some things right away to manage stress.</p>
              <ol>
                <li>
                  <p><b>Take a break from the stress.</b>This isn’t the same thing as avoiding the stress forever, but even just taking a 20 minute break to do something
                  different and care for yourself is helpful.</p>
                </li>
                <li>
                  <p><b>Figure out what is causing stress in your life.</b>Pay attention to your reactions to things and how they make you feel, especially if your response is sad, angry, or
                  otherwise negative.</p>
                </li>
                <li>
                  <p><b>Look for ways to reduce the impact of those stress sources.</b>Maybe talking things through will help, or maybe distancing yourself from the issue is the best thing to do.</p>
                </li>
                <li>
                  <p><b>Learn healthy ways to relieve stress.</b>Maybe a walk around your neighborhood. Or a coffee date with a friend. Call a friend you haven’t talked to in a while
                  and catch up. Maybe a yoga class or deep breathing exercises is what you need. Or a vacation. Or talk/cry/laugh it out
                  with someone you trust.</p>
                </li>
              </ol>
              <div class="space-30"></div>
              <h3>For more information on ways to deal with stress, please see:</h3>
              <p>Stress Management Overview: <a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=rlxsk" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=rlxsk</a></p>
              <p>Stress Management – Breathing Exercises: <a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=ug1812" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=ug1812</a>
              </p>
              <p>Stress Management – Breathing Exercises for Relaxation: <a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2255" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2255</a>
              </p>
              <p><a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2270" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2270</a></p>
              <p>Progressive Muscle Relaxation: <a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2225" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2225</a>
              </p>
              <p>Meditation: <a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2240" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2240</a>
              </p>
              <p>Imagery Exercises: <a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=ta5531" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=ta5531</a>
              </p>
              <p>Yoga: <a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2286" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2286</a>
              </p>
              <p>Reducing Stress by Being Assertive: <a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=av2095" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=av2095</a>
              </p>
              <p>Relaxing Your Mind and Body: <a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2209" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=uz2209</a>
              </p>
              <p>Stress Relief and Relaxation: <a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=af1003spec" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=af1003spec</a>
              </p>
              <p>Five tips to help manage stress (APA): <a
                  href="https://www.apa.org/helpcenter/manage-stress.aspx" target="_blank">https://www.apa.org/helpcenter/manage-stress.aspx</a>
              </p>
              <div class="space-30"></div>
              <h3>References:</h3>
              <p><a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=rlxsk" target="_blank">
                  https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=rlxsk
                </a>
              </p>
              <p><a href="https://www.webmd.com/pain-management/coping-strategies_for-chronic-illness" target="_blank">
                  https://www.webmd.com/pain-management/coping-strategies_for-chronic-illness
                </a>
              </p>})
Resource.create!(title: "Helping Myself - Dealing with Insomnia",
  description: "Insomnia can become a problem for different people for different reasons.",
  content_page: %{<p>Insomnia can become a problem for different people for different reasons. Most of the time, simple changes in your
              daytime habits can result in the little shifts that are needed to get a good night’s sleep. Maybe you used to have good
              sleep habits, but your chronic care needs have disrupted them. Maybe you’ve had to make changes that aren’t helping your
              sleep habits. Talking to your doctor about your sleeping problems, as well as trying these tips, could help lead to you
              getting a better night’s sleep.</p>
              <div class="space-30"></div>
              <h2>#1 Avoid Caffeine, Alcohol, Nicotine, and Other Substances that Can Interfere with Sleep</h2>
              <p>Coffee, tea, chocolate, soda, and pain medications can all contain caffeine. Some people are more sensitive than others,
              but generally avoiding these things for four to six hours before bedtime is a good place to start. If you’re more
              sensitive, maybe one cup of coffee or tea first thing in the morning is all you really need. Maybe the lowered energy or
              increased fatigue that came with your chronic care needs had you reaching for that extra cup of coffee or tea as a way
              to cope or get through the day, but it might be helping you less than you think if you’re having trouble sleeping at
              night. Try cutting it down (or even out) for a few days and see if you feel better. The same goes for tobacco products.</p>
              <p>Even though alcohol can make you feel sleepy at first, after a few hours it acts like a stimulant, waking you up more
              often in the night, or making your sleep less restful. If you’re having trouble sleeping, try cutting your alcohol
              intake down to one or two drinks a day, and stop at least three hours before bedtime.</p>
              <div class="space-30"></div>
              <h2>#2 Make your Bedroom a Sleep-Supporting Space</h2>
              <p>A cool, dark, and quiet room is what you want to aim for when setting up a space to sleep in. This is why bats choose
              dark caves! Maybe your sleep environment was disrupted by a hospital stay or temporarily needing a different sleep set
              up to accommodate some physical change. Do what you can to promote a comfortable sleep space again though, as much as
              you can.</p>
              <p>To make a room <b></b>quiet, look for ways to reduce the amount of outside noise with earplugs or a white noise device. The
              less noise that can disturb or wake you, the better you will sleep.</p>
              <p>To make the room <b>dark</b>, heavy curtains, blackout shades, or an eye-mask may be the ticket. Light is a powerful cue that
              tells your brain that it’s time to be awake and alert. So, the more you can block out, the stronger the message you can
              send your brain to get ready for sleep.</p>
              <p>To keep the room cool, adjust the thermostat to a temperature between 15 and 24 degrees Celcius, or use a lighter
              blanket, duvet, or comforter. Cotton sheets (as opposed to polyester or microfibre) also help to cool down your sleep
              space.</p>
              <p>Finally, make sure you have a comfortable mattress and pillows. Remember that most mattresses need to be replaced every
              10 years. You can also help your mind associate your bedroom with sleep even more by limiting activities to sleep and
              sex only. Things like computers, TVs, work materials, or intense reading can confuse your mind into thinking this is a
              space for alertness, which it really isn’t!</p>
              <div class="space-30"></div>
              <h2>#3 Set Yourself Up for Sleep Success with a Soothing Pre-Sleep Routine</h2>
              <p>Help your mind wind down from the day’s activities with some relaxing activities. These can be calm things you like to
              do, such as taking a bath, reading a book, or doing some relaxation exercises. Avoid anything that’s stressful or
              stimulating, such as work, difficult conversations, or intense TV shows. Things that are physically or mentally
              stressful can make your body release stress hormones that are associated with alertness. Keep a notepad near your bed for those worrisome things that
              don’t want to leave your mind, so that you can write them down and forget about them until the morning.</p>
              <div class="space-30"></div>
              <h2>#4 Only Go to Sleep When You’re Actually Tired</h2>
              <p>Sometimes you struggle to fall asleep, and that can make you frustrated, which only complicates getting to sleep. If
              you’re not asleep after 20 minutes of trying, get up, leave the room, and do something relaxing in a dimly lit space.
              Try reading a book or listening to music until you’re good and tired.</p>
              <div class="space-30"></div>
              <h2>#5 Hide Your Clock</h2>
              <p>You might not realize it, but watching and worrying about the time that you’re not sleeping is another source of stress,
              and we’ve already pointed to stress being unhelpful for sleep. Cover the clock’s face or turn it away from you so that
              you aren’t tempted to look at it and worry about the time.</p>
              <div class="space-30"></div>
              <h2>#6 Keep Bedtime Consistent, Even on Weekends</h2>
              <p>Going to bed and waking up at the same time each day helps set your body’s internal clock to a pattern. Steadily making
              your space smaller by locking doors to closing your bedroom doors helps to set up a cozy and comfortable space.
              Gradually dim the lights as you head to bed to send your brain the message that the day is ending. Try to stick to your
              routine as much as possible, even on weekends. Waking up at the same time each day is one of the best ways to set your
              internal clock, even when you haven’t slept well the night before. The extra sleep pressure the following night will
              help you sleep.</p>
              <div class="space-30"></div>
              <h2>#7 The Truth About Naps</h2>
              <p>Maybe your chronic care needs leave you more tired or less energetic, or maybe you need to rest as you recover from a
              recent complication. Naps might seem like the perfect solution, but if you take naps too often or nap for too long
              during the day, you can actually make it harder to sleep at night. This happens for several reasons. First, your mind
              and body can lose the distinction between awake and asleep, making it harder to get to sleep at night. Second, by taking
              a long nap during the day, you reduce the “pressure to sleep” at bedtime. If you must nap, it’s best to keep it short
              and finish before 5pm.</p>
              <div class="space-30"></div>
              <h2>#8 Keep Evening Meals Light</h2>
              <p>A late or heavy meal right before bed might make it hard for you to get to or stay asleep. Finish dinner several hours
              before bedtime and avoid foods that cause indigestion, such as spicy, super sweet, or greasy foods. If you get hungry at
              night, snack on foods that are less likely to disturb your sleep such as dairy (for example, a glass of milk or small
              piece of cheese) or carbohydrates (a few crackers, a banana, or a piece of toast).</p>
              <div class="space-30"></div>
              <h2>#9 Exercise Earlier in the Day</h2>
              <p>Exercising (within the context of what you’re able to do) is a good way to use up energy and relax. Both of these things
              promote a restful sleep when it’s time for bed. Exercise also releases cortisol, which tells your brain to be awake and
              alert. This is great, unless it’s close to bed time and you’re trying to calm your mind down to sleep. Try to finish
              exercise activities at least three hours before bed for the best sleep set up.</p>
              <div class="space-30"></div>
              <h2>#10 Stick to It, and Consider Professional Help</h2>
              <p>Some of these changes might lead to fast results; others might take a few days or more to have effect. Stick with the
              changes and you’ll be more likely to overcome your sleep issues. Remember that not all sleep problems can be overcome
              with lifestyle change. Some problems require professional help to diagnose and treat. If you’ve tried all the tips here
              and are still having problems sleeping, talk to your doctor.</p>
              <div class="space-30"></div>
              <h3>For more information, please see:</h3>
              <p>Insomnia: Improving Your Sleep <a href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=zq1031" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=zq1031</a></p>
              <p>Insomnia Care Instructions: <a
                  href="https://myhealth.alberta.ca/health/AfterCareInformation/pages/conditions.aspx?HwId=zc2584" target="_blank">https://myhealth.alberta.ca/health/AfterCareInformation/pages/conditions.aspx?HwId=zc2584</a>
              </p>
              <div class="space-30"></div>
              <h3>References:</h3>
              <p>Twelve Simple Tips to Improve Your Sleep (Harvard Medicine) <a href="http://healthysleep.med.harvard.edu/healthy/getting/overcoming/tips" target="_blank">
                  http://healthysleep.med.harvard.edu/healthy/getting/overcoming/tips
                </a>
              </p>
              <p>Getting a Good Night’s Sleep – Sleep Hygiene (Anxiety BC). <a href="https://www.anxietycanada.com/sites/default/files/SleepHygiene.pdf" target="_blank">
                  https://www.anxietycanada.com/sites/default/files/SleepHygiene.pdf
                </a>
              </p>
              <p>DeBoer, T. (2018). Sleep homeostasis and the circadian clock: Do the circadian pacemaker and sleep homeostat influence
              each other’s functioning? <a
                  href="https://www.sciencedirect.com/science/article/pii/S2451994417300068" target="_blank">
                  https://www.sciencedirect.com/science/article/pii/S2451994417300068
                </a>
              </p>})
Resource.create!(title: "Staying Healthy - The Importance of Social Health and Finding Social Supports",
  description: "Living with a chronic condition can be stressful at times.",
  content_page: %{<p>Living with a chronic condition can be stressful at times. You can increase your ability to deal with these stressful
              situations by having a strong network of friends and/or family that you can lean on. Your network can be big or
              small–whatever works for you. The important thing is that you are there for each other, help each other when things
              aren’t going so well, and make each other feel valued and supported.</p>
              <p>With the support from your social connections, stressful situations can seem less overwhelming and easier to overcome.</p>
              <div class="space-30"></div>
              <h3>For more information on social health and social support networks, please see:</h3>
              <p><a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=abl0295" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=abl0295</a></p>
              <p><a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=abk9962&#abk9963" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=abk9962&#abk9963</a>
              </p>})
Resource.create!(title: "Anxiety Overview",
  description: "Anxiety presents itself in many ways, both physical and emotional. It is normal to feel worried or stressed out sometimes.",
  content_page: %{<p>Anxiety presents itself in many ways, both physical and emotional. It is normal to feel worried or stressed out
              sometimes. It is not normal, though, to have anxious feelings that interfere with your life. Emotional symptoms of
              anxiety include feelings of doom, difficulty concentrating, or worrying excessively. Physical symptoms includes feelings
              of fullness in the chest, jumpiness, or muscle tension.</p>
              <p>There are many ways to manage anxiety. Anxiety treatment is unique to every person. For most people, it is some
              combination of therapy, medications, and lifestyle changes.</p>
              <p>If you think you might have anxiety, talk to your doctor. They can connect you with the support you need.</p>
              <div class="space-30"></div>
              <h3>For more information, visit MyHealth.Alberta.ca:</h3>
              <p><a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=anxty&#hw257184" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=anxty&#hw257184</a></p>
              <div class="space-30"></div>
              <h3>References</h3>
              <p>
              Canadian Mental Health Association. Anxiety Disorders. Website: <a href-"https://cmha.ca/documents/anxiety-disorders" target="_blank">https://cmha.ca/documents/anxiety-disorders</a>. Accessed
              2018 Oct 05.</p>
              <p>
              Mayo Clinic. Generalized anxiety disorder. Website:
              <a href="https://www.mayoclinic.org/diseases-conditions/generalized-anxiety-disorder/diagnosis-treatment/drc-20361045" target="_blank">https://www.mayoclinic.org/diseases-conditions/generalized-anxiety-disorder/diagnosis-treatment/drc-20361045</a>. Accessed
              2018 Oct 11.</p>
              <p>
              MyHealth.Alberta.ca. Anxiety – Topic Overview.
              <a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=anxty&#hw257184" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=anxty&#hw257184</a>. Accessed 2018 Oct 05.</p>})
Resource.create!(title: "Medical Uncertainty",
  description: "With chronic conditions, it is common to have experiences where your care team is unsure of what step to take next. This is especially the case if you haven’t received a diagnosis, or perhaps, you haven’t found a treatment plan that works for you yet.",
  content_page: %{<p>With chronic conditions, it is common to have experiences where your care team is unsure of what step to take next. This
              is especially the case if you haven’t received a diagnosis, or perhaps, you haven’t found a treatment plan that works
              for you yet. Remember, everyone is different and responds to things differently. “Wait and see” is okay. Finding the
              right combination of medications, self-help strategies, or even a diagnosis can take time. Your care team wants to help
              you and wants to give you answers. Sometimes, it just takes time.</p>
              <div class="space-30"></div>
              <h3>For more information, check out these resources:</h3>
              <p>When you can’t get a diagnosis: <a href="https://www.verywellhealth.com/when-you-cant-get-a-diagnosis-2615487" target="_blank">https://www.verywellhealth.com/when-you-cant-get-a-diagnosis-2615487</a></p>
              <p>What is it like to not be diagnosed with MS?: <a
                  href="https://multiplesclerosis.net/living-with-ms/what-is-it-like-to-not-be-diagnosed/" target="_blank">https://multiplesclerosis.net/living-with-ms/what-is-it-like-to-not-be-diagnosed/</a>
              </p>})
Resource.create!(title: "Depression Overview",
  description: "Depression is also known as major depressive disorder. It can make you feel sad, tired, worthless, unfocused, and even suicidal.",
  content_page: %{<p>Depression is also known as major depressive disorder. It can make you feel sad, tired, worthless, unfocused, and even
              suicidal. People with depression can experience these symptoms for two weeks or more. Depression can affect anyone. Some
              people, though, are more at risk than others. Risk factors for depression include a family history of depression,
              personality, or environmental factors. Depression is a serious, but treatable, illness. Medication, therapy, exercise,
              sleep, and diet changes can all help with your symptoms.</p>
              <p>Talk to your doctor if you think you may be at risk for depression.</p>
              <div class="space-30"></div>
              <h3>For more information, visit MyHealth.Alberta.ca:</h3>
              <p><a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw30709&#hw30711" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw30709&#hw30711</a></p>
              <div class="space-30"></div>
              <h3>References</h3>
              <p>
              <p>
              Canadian Mental Health Association. Anxiety Disorders. Website: <a href="https://www.psychiatry.org/patients-families/depression/what-is-depression" target="_blank">https://www.psychiatry.org/patients-families/depression/what-is-depression</a>. Accessed
              2018 Oct 05.</p>
              <p>
              MyHealth.Alberta.ca. Depression – Topic Overview. Website:
              <a href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw30709&#hw30711" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=hw30709&#hw30711</a>. Accessed
              2018 Oct 05.</p>})
Resource.create!(title: "Role of Exercise in Self-management",
  description: "Exercise has many physical and emotional benefits. It can help with weight loss, improve your emotional wellbeing, and increase the health of your muscles, joints, lungs, and heart.",
  content_page: %{<p>Exercise has many physical and emotional benefits. It can help with weight loss, improve your emotional wellbeing, and
              increase the health of your muscles, joints, lungs, and heart. Most importantly, exercise can help you prevent or manage
              chronic illness. Getting regular exercise is an important part of managing any chronic condition.</p>
              <p>There are lots of ways to exercise, and you don’t have to be an athlete to do it. Walking, cycling, gardening, and
              swimming are examples of low-impact exercises that could help you manage your chronic illness. If you are starting a new
              exercise routine, it’s important to talk to your doctor before you get going. Your doctor will be able to help you plan
              an exercise program that is right for you.</p>
              <div class="space-30"></div>
              <h3>For more information, visit MyHealth.Alberta.ca:</h3>
              <p>Getting and Staying Active: <a href="https://myhealth.alberta.ca/health/pages/conditions.aspx?hwid=ftpln&#hw155909" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?hwid=ftpln&#hw155909</a></p>
              <p>Fitting Physical Activity into Your Day: <a
                  href="https://myhealth.alberta.ca/health/pages/conditions.aspx?hwid=zx3485&#zx3486" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?hwid=zx3485&#zx3486</a>
              </p>
              <p>How to Start Being Active:<a
                  href="https://myhealth.alberta.ca/Alberta/Pages/physical-activity-and-exercise.aspx" target="_blank">https://myhealth.alberta.ca/Alberta/Pages/physical-activity-and-exercise.aspx</a>
              </p>
              <p>Tips for People Who Don’t Like to Exercise:<a
                  href="https://myhealth.alberta.ca/Alberta/Pages/tips-do-not-like-exercise.aspx" target="_blank">https://myhealth.alberta.ca/Alberta/Pages/tips-do-not-like-exercise.aspx</a>
              </p>
              <p>Getting Around Barriers to Exercise:<a
                  href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=ta2537" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=ta2537</a>
              </p>})
Resource.create!(title: "Weight Management",
  description: "Staying at a healthy weight helps manage every kind of chronic condition.",
  content_page: %{<p>Staying at a healthy weight helps manage every kind of chronic condition. A healthy weight is not about being thin. A
              healthy weight is the result of a healthy lifestyle that has regular exercise and a balanced diet. Try to think about
              things you can add to your life to reach a healthy weight, like adding in exercise to your daily routine, or adding in
              more fresh vegetables and fruits at meal times.</p>
              <p>Many weight-loss programs tend to recommend extreme diet and exercise regimens that are not sustainable. If you are
              thinking about making a change to your diet or exercise plan, talk to your doctor. There are many health professionals
              who want to help you get to a healthy weight.</p>
              <div class="space-30"></div>
              <h3>For more information, visit MyHealth.Alberta.ca:</h3>
              <p>Healthy Weight: What Works (video only): <a href="https://myhealth.alberta.ca/health/Pages/HealthVideoPlayer.aspx?xCat=HCNutrition#" target="_blank">https://myhealth.alberta.ca/health/Pages/HealthVideoPlayer.aspx?xCat=HCNutrition#</a></p>
              <p>Fitting Physical Activity into Your Day: <a
                  href="https://myhealth.alberta.ca/health/pages/conditions.aspx?hwid=zx3485&#zx3486" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?hwid=zx3485&#zx3486</a>
              </p>
              <p>Your Best Health: Adult Weight Management (Learning Module):<a
                  href="https://myhealth.alberta.ca/Alberta/Pages/physical-activity-and-exercise.aspx" target="_blank">https://myhealth.alberta.ca/Alberta/Pages/physical-activity-and-exercise.aspx</a>
              </p>
              <p>Weight Management: Stop Negative Thoughts: <a
                  href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=uf9874" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=uf9874</a>
              </p>
              <p>Exercise and Physical Activity Ideas:<a
                  href="https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=aa165656" target="_blank">https://myhealth.alberta.ca/health/Pages/conditions.aspx?hwid=aa165656</a>
              </p>
              <div class="space-30"></div>
              <h3>References</h3>
              <p>
              MyHealth.Alberta.ca. Weight Management – Overview. <a href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=aa122915" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=aa122915</a>. Accessed
              2018 Oct 11.</p>})
Resource.create!(title: "Nutrition",
  description: "Eating a nutritious diet has many benefits.",
  content_page: %{<p>Eating a nutritious diet has many benefits. Nutritious eating lowers your risk of diseases, improves your overall
              health, and increases your daily energy levels. Everyone can take steps to improve their own health by making small
              changes to their diet.</p>
              <h2>Five Easy Steps to a Healthy Diet:</h2>
              <div class="space-20"></div>
              <ol>
                <li>
                  <p>Choose natural or minimally processed foods as often as possible. Limit your intake of processed foods, and try to avoid
                  eating ultra-processed foods altogether.</p>
                  <ul>
                    <li>
                      <p>Natural/minimally processed – food that has either not been altered at all or only altered slightly from the form it
                        takes in nature (e.g. fresh fruit, leafy greens, dried beans, polished grains, eggs, pasteurized milk, chilled meat)</p>
                    </li>
                    <li>
                      <p>Processed – food that has been manufactured with salt or sugar to change it from its natural form (e.g. fruit juice,
                      cheese, bread)
                      </p>
                    </li>
                    <li>
                      <p>Ultra-processed – food that has undergone lots of manufacturing steps and ingredient additions to arrive at its final
                      form (e.g. breakfast cereal, packaged biscuits, chicken nuggets, frozen pizzas)
                      </p>
                    </li>
                  </ul>
                </li>
                <li>
                  <p>Shop for your own ingredients to prepare food at home.</p>
                  <ul>
                    <li>
                      <p>Whenever possible, plan your meals and shop for groceries in advance to make preparing food at home the easy, affordable
                      choice</p>
                    </li>
                    <li>
                      <p>Shop in places that offer a variety of natural or minimally processed foods
                      </p>
                    </li>
                    <li>
                      <p>If you are eating or ordering food outside of your home, choose places that serve freshly made, minimally processed
                      meals. Avoid fast foods as much as possible.
                      </p>
                    </li>
                  </ul>
                </li>
                <li>
                  <p>Work to develop and share your cooking skills with family and friends.</p>
                  <ul>
                    <li>
                      <p>Try to make cooking at home a priority. This will help make eating minimally processed foods easy and affordable.</p>
                    </li>
                    <li>
                      <p>Use oils, fats, and salt, and sugar in small amounts when seasoning and cooking food. In small amounts, these seasonings
                      can contribute to delicious and nutritious meals.
                      </p>
                    </li>
                  </ul>
                </li>
                <li>
                  <p>Eat regularly and mindfully, and eat in the company of others.</p>
                  <ul>
                    <li>
                      <p>Eating regularly means eating when you are hungry. Eating mindfully means slowing down to enjoy the taste and texture of
                      your meals without doing another activity at the same time.</p>
                    </li>
                    <li>
                      <p>Plan your time to make food and eating important in your life. Try to make an effort to share cooking tasks and meal
                      times with family, friends, or co-workers.
                      </p>
                    </li>
                  </ul>
                </li>
                <li>
                  <p>Be wary of food and diet marketing.</p>
                  <ul>
                    <li>
                      <p>If a food or diet sounds too good to be true, it probably is. For example, if you hear a new method to “Lose Seven
                      Pounds in Seven Days,” approach the idea with a great deal of skepticism</p>
                    </li>
                    <li>
                      <p>For the majority of people, a balanced diet can include all types of foods and food groups. If you eat a balanced diet,
                      additional supplements (e.g. vitamins or minerals) are rarely required.
                      </p>
                    </li>
                    <li>
                      <p>Your medical doctor or registered dietitian is the best starting point for evidence-based information about food,
                      nutrition, and diets – they can connect you with appropriate and trustworthy resources to help you gather information.
                      </p>
                    </li>
                  </ul>
                </li>
              </ol>
              <div class="space-30"></div>
              <h3>For more information, visit MyHealth.Alberta.ca:</h3>
              <p>Getting started on healthy eating: <a href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=nutri" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=nutri</a></p>
              <p>Changing your eating habits:<a
                  href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=ad1169" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=ad1169</a>
              </p>
              <p>Making healthy choices when you shop:<a
                  href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=uz2171" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=uz2171</a>
              </p>
              <p>Influences on eating behavior:<a
                  href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=uz2171" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=uz2171</a>
              </p>
              <div class="space-30"></div>
              <h3>References</h3>
              <p>Government of Canada (2016). Canada’s food guides (website). Accessed July 17, 2018.<a href="https://www.canada.ca/en/health-canada/services/food-nutrition/canada-food-guide/maintaining-healthy-habits/overcome-barriers.html" target="_blank">https://www.canada.ca/en/health-canada/services/food-nutrition/canada-food-guide/maintaining-healthy-habits/overcome-barriers.html</a></p>
              <p>Ministry of Health of Brazil (2015). Dietary Guidelines for the Brazilian Population (2015). Virtual Library of Ministry
              of Health of Brazil. Accessed July 17, 2018.<a
                  href="http://bvsms.saude.gov.br/bvs/publicacoes/dietary_guidelines_brazilian_population.pdf" target="_blank">http://bvsms.saude.gov.br/bvs/publicacoes/dietary_guidelines_brazilian_population.pdf</a>
              </p>
              <p>World Health Organization (2004). Diet, nutrition, and the prevention of chronic diseases. Report of the joint WHO/FAO
              expert consultation. WHO Technical Report Series, No. 916 (TRS 916). Accessed July 17, 2018.<a
                  href="http://www.who.int/dietphysicalactivity/publications/trs916/summary/en/" target="_blank">http://www.who.int/dietphysicalactivity/publications/trs916/summary/en/</a>
              </p>})
Resource.create!(title: "Internet/Information Literacy Overview",
  description: "When you’re looking online for health information, it can feel overwhelming. Who do you trust? Here are some tips for success",
  content_page: %{<p>The internet contains a lot of information. When you’re looking online for health information, it can feel overwhelming.
              Who do you trust? Here are some tips for success (adapted from Johns Hopkins Bayview Medical Centre):</p>
              <ul>
                <li>
                  <p>Instead of using a search engine, start your search on a high-quality website. Try MyHealth.Alberta.ca or
                  MedlinePlus.gov.</p>
                </li>
                <li>
                  <p>Look at the website address. Commercial ("dot com") sites are prone to bias and conflict of interest. Favour educational
                  institutions (address ending in .edu) or government websites (address ending in gc.ca or .gov) when looking for
                  high-quality information.</p>
                </li>
                <li>
                  <p>Check the date the page was last updated. Because medical information can change often, it’s best to choose information
                  that is less than three years old. If there is no date provided, be skeptical of the information.</p>
                </li>
                <li>
                  <p>Look for the article author’s name and credentials (e.g. doctor, nurse, psychologist). Health information articles
                  should be written or reviewed by health professionals with references to legitimate sources of scientific information.</p>
                </li>
              </ul>
              <p>Gaining internet literacy takes practice. Doctors are trained to understand the quality of medical evidence. If you have
              any questions about health information you’ve found online, check with your doctor.</p>
              <div class="space-30"></div>
              <h3>For more information, check out these resources:</h3>
              <p>Digital Literacy Resources: <a href="https://digitalliteracy.gov/resources-by-term/62" target="_blank">https://digitalliteracy.gov/resources-by-term/62</a></p>
              <p>Finding Reliable Health Information Online: <a
                  href="https://www.hopkinsmedicine.org/johns_hopkins_bayview/patient_visitor_amenities/community_health_library/finding_reliable_health_information_online.html" target="_blank">https://www.hopkinsmedicine.org/johns_hopkins_bayview/patient_visitor_amenities/community_health_library/finding_reliable_health_information_online.html</a>
              </p>
              <p>Evaluating Consumer Health Websites (slideshow presentation): <a
                  href="https://www.slideshare.net/JHBMC_CHL/evaluating-consumer-health-websites" target="_blank">https://www.slideshare.net/JHBMC_CHL/evaluating-consumer-health-websites</a>
              </p>
              <div class="space-30"></div>
              <h3>References</h3>
              <p>Johns Hopkins Bayview Medical Center. Finding Reliable Health Information Online. Website: <a href="https://www.hopkinsmedicine.org/johns_hopkins_bayview/patient_visitor_amenities/community_health_library/finding_reliable_health_information_online.html" target="_blank">https://www.hopkinsmedicine.org/johns_hopkins_bayview/patient_visitor_amenities/community_health_library/finding_reliable_health_information_online.html</a></p>})
Resource.create!(title: "Self-Tracking – Importance of Self-Tracking",
  description: "Depending on your chronic care needs, you might need to track diet, carbohydrates, exercise, water intake, weight, mood, blood sugar, blood pressure, or something else that your doctor recommends.",
  content_page: %{<p>Depending on your chronic care needs, you might need to track diet, carbohydrates, exercise, water intake, weight, mood,
              blood sugar, blood pressure, or something else that your doctor recommends. You already have a lot to keep track of in
              your day-to-day life. Why should you start tracking health things on top of it all?</p>
              <p>Believe it or not, by tracking specific pieces of information like the ones listed above, either you or your care
              providers can gain insight into how well your chronic care needs are being addressed. You might even be able to make
              adjustments to your diet, exercise, activities, or medications that could help you feel even better.</p>
              <p>To help you figure out what you should track, we’ve created a Tracking Tool with some specially designed visual aids to
              promote data insights to get you started. Depending on what you need to track, you might also be able to use a
              smartphone or other devices to get the information you need.</p>
              <div class="space-30"></div>
              <h3>For more information on self-tracking and some paper-based forms you can try, please see:</h3>
              <p><a href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=bs1005" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=bs1005</a></p>})
Resource.create!(title: "Reminders – How they Work and What They’re for",
  description: "When you have chronic care needs, there may be extra things you need to keep track of, like appointments, lab work, or daily medications.",
  content_page: %{<p>When you have chronic care needs, there may be extra things you need to keep track of, like appointments, lab work, or
              daily medications. If you try to keep it all in your head, you might forget something important (like taking your
              medications), or forget to get lab work done ahead of your next doctor’s appointment.</p>
              <p>Setting timely reminders to complete these activities can alleviate many of these issues, help you put your chronic care
              needs into the background of your life, and let you focus on the things that are important to YOU!</p>})
Resource.create!(title: "Goals and Goal Setting",
  description: "Maybe you’ve decided to make a change. Maybe you’re still thinking about it. Whether you’re looking to improve your current health, prevent future issues, or just feel better, setting SMART goals can help you turn those ideas into a plan.",
  content_page: %{<p>Maybe you’ve decided to make a change. Maybe you’re still thinking about it. Whether you’re looking to improve your
              current health, prevent future issues, or just feel better, setting SMART goals can help you turn those ideas into a
              plan, or help you work through the details of making that change.</p>
              <p>Whatever you want to change, make sure you have your own reason to make that change. Keep in mind that it often takes
              time to change habits. By taking the time now to think about why this is important to you, you are more likely to be
              successful in the long run.</p>
              <p>You’ll also want to be prepared for slip-ups and setbacks. Change is hard, and things don’t always go according to plan.
              If you’ve come across a setback, think about what might have caused it. Or if you’ve tried to make a change in the past,
              think about what helped you and what maybe got in the way. As you do this, try to stay positive. Change is hard.</p>
              <p>Get a support strategy together. The more support you have for making a change, the easier it will be to make that
              change. Support can come from a variety of places, such as an exercise buddy, or positive feedback from family and
              friends. Maybe joining a class or support group is more your style. Set yourself up for positive reinforcement and focus
              on the progress you’ve made.</p>
              <div class="space-30"></div>
              <h3>For more information on goals and goal setting, talk to your doctor, or visit MyHealth.Alberta.ca:</h3>
              <p><a href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=abk7429" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=abk7429</a></p>
              <p><a href="https://myhealth.alberta.ca/Alberta/Pages/Setting-smart-goals.aspx" target="_blank">https://myhealth.alberta.ca/Alberta/Pages/Setting-smart-goals.aspx</a></p>
              <div class="space-30"></div>
              <h3>Communicating your goals with your care providers</h3>
              <p>Whether the idea for a health-related change came from you or from a care provider, it’s a good idea for you to tell
              your care provider about your goals. They might be able to suggest resources or supports to help you on your way. Your
              car provider can also answer questions you might have about how to best achieve your goals in light of your chronic care
              needs.</p>
              <p>To help you communicate your goals with your care providers, we’ve set up a Goal Creation Tool to help you set up SMART
              goals, as well as a Report to Provider Tool to help you share your goals with your care provider.</p>
              <div class="space-30"></div>
              <h3>Bringing in goals from existing care plans</h3>
              <p>Perhaps you and your care provider talked about making some changes to better manage your chronic conditions. Maybe your
              care provider filled out a care plan document that included some goals for you to work towards but without details on
              how to reach those goals.</p>
              <p>Don’t worry, you can take those goals and turn them into SMART goals. We’ve even created a tool to walk you through the
              process of creating a SMART goal.</p>
              <div class="space-30"></div>
              <h3>Want more information?</h3>
              <p>Setting Smart Goals:<a
                  href="https://myhealth.alberta.ca/Alberta/Pages/Setting-smart-goals.aspx" target="_blank">https://myhealth.alberta.ca/Alberta/Pages/Setting-smart-goals.aspx</a>
              </p>
              <p>Change a Habit by Setting Goals:<a
                  href="https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=abk7429" target="_blank">https://myhealth.alberta.ca/health/pages/conditions.aspx?Hwid=abk7429</a>
              </p>})
