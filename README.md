# My Care Compass
![mcc-landing](https://github.com/user-attachments/assets/92094208-ffc0-4bf2-be07-c16039f1d45e)


A patient care planning platform for the Ward of the 21st Century at University of Calgary.

Hosted on AWS at: http://mycarecompass.ca/

## Features

📚 Resources and Information finding tool

📝 Profile & personal conditions

💊 Medications List

📅 Calendar tool

🔔 Reminder tool

✅ Appointment Checklist

🎯 Goal creation and summary

📈 Track symptoms data entry tool

📊 Track symptoms data insights tool

📝 Generate report for care provider (print/pdf)

## Stack

**Front-End:** Bootstrap, SASS, JQuery/Ajax

Landing page Template: [Appro](http://quomodosoft.com/html/appro/demo/index3.html)

Dashboard Template: [AppWork](https://uxpowered.com/products/appwork/v110/angular-demo/dashboards/dashboard-2)

Chart: [Chartist](https://gionkunz.github.io/chartist-js/)

Form: [SmartWizard](https://github.com/techlab/SmartWizard)

**Back-End:** Ruby On Rails, PostgreSQL 2.1.5

## Ruby and Gems

**Ruby Version:** 2.3.3

**RUBYGEMS Version:** 2.5.2

* Devise

* Cocoon

## How to run

* Running application locally

Install all the gems Rails will need to get started
```
bundle install
```

runs migrations for the current env that have not run yet
```
db:migrate
```

Load schema and seeds data. This command runs db:schema:load, db:seed
```
rails db:setup
```

Run on localhost:3000
```
rails s
```

# Deployment instructions

Deploy on EC2 using Elastic Beanstalk
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/ruby-rails-tutorial.html

Precompile:
```
RAILS_ENV=production rake assets:precompile
```

we have used upload and deploy on Elastic Beanstalk. Create a source bundle containing the files created by Rails.

Command to zip file:
```
zip ../rails-default.zip -r * .[^.]*
```

* Setup Database environment
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_Ruby.rds.html

* Elastic Beanstalk environment configuration
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/ebextensions.html

- Create a file in project directory **.ebextensions/seed.config**
This migrates and resets the database
```
container_commands:
  01_db_migrate:
    command: rake db:migrate
  01_db_reset:
    command: RAILS_ENV=production rake db:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```

# Screenshots
![mcc-learning](https://github.com/user-attachments/assets/36ab6342-e297-40a2-8e49-6142970168fc)

![mcc-symptom-tracking](https://github.com/user-attachments/assets/a6fe6b85-6801-4fc6-a3ba-23473c7b6a5b)
![mcc-symptoms-summary](https://github.com/user-attachments/assets/b0ae156f-cfe1-48c7-8e87-8e5e442ce0c8)

![mcc-calendar](https://github.com/user-attachments/assets/d33e5b4c-dc2b-4086-bd89-60213aa43545)

<img width="1004" alt="image" src="https://github.com/user-attachments/assets/884a102d-d771-4d3e-96d9-e13ef85acd3a">

![mcc-fullscreen-landing](https://github.com/user-attachments/assets/d7e6bccd-2b2f-450f-963e-706236d89b58)

