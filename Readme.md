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
