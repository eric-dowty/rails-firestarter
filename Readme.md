BASIC RAILS APP

rails-firestarter initializes a new rails app with all the Gems and customizations needed to run the following configuration in a single rake task:

    - Postgresql (database)
    - Bootstrap (css & styling)
    - Rspec (test setup)
    - Guard (persistent test module)
    - Unicorn (local server)

Step 1: clone 'rails-firestarter' repository

Step 2: cd into local 'rails-firestarter' repository

Step 3: run the following rake command; the value for the variable 'app' will be your new app's name:

      rake app=app_name fire:starter

Step 4: cd into 'new_app' directory - rails app configured and ready

Step 5 (optional): from root directory of 'new_app' type 'guard' to start persistent testing


RAILS APP WITH SECURE SIGN IN CAPABILITY

rails-firestarter secure initializes the basic rails app described above along with the addition of secure login functionality with pre-built test scripts

Step 1: follow steps 1 and 2 from BASIC RAILS APP above

Step 3: run the following rake command; the value for the variable 'app' will be your new app's name:

      rake app=app_name fire:secure

Step 4: cd into 'new_app' directory and run the following rake command to setup the Postgres database

      rake db:create db:migrate db:seed

Step 5 (optional): from root directory of 'new_app' type 'guard' to start persistent testing


RAILS APP WITH BASIC E-COMMERCE FUNCTIONALITY

rails-firestarter commerce initializes the basic rails app described above along with the addition of secure login functionality and a basic e-commerce setup with pre-built test scripts

Step 1: follow steps 1 and 2 from BASIC RAILS APP above

Step 3: run the following rake command; the value for the variable 'app' will be your new app's name:

      rake app=app_name fire:commerce

Step 4: cd into 'new_app' directory and run the following rake command to setup the Postgres database

      rake db:create db:migrate db:seed

Step 5 (optional): from root directory of 'new_app' type 'guard' to start persistent testing
