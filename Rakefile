namespace :fire do

  task :app do
    app = ENV["app"] || "sandbox"
    Dir.chdir ".." do
      system("rails new #{app} --database=postgresql -T -B")
    end
  end

  task :tinderbox do
    app = ENV["app"] || "sandbox"
    system("cp -f tinderbox/Gemfile ../#{app}")
    system("rm ../#{app}/app/assets/stylesheets/application.css")
    system("cp tinderbox/application.css.sass ../#{app}/app/assets/stylesheets")
    system("cp -f tinderbox/application.js ../#{app}/app/assets/javascripts")
    system("cp -f tinderbox/routes.rb ../#{app}/config")
    system("cp -f tinderbox/application.html.erb ../#{app}/app/views/layouts")
  end

  task :bundle do
    app = ENV["app"] || "sandbox"
    Dir.chdir "../#{app}" do
      system("bundle")
    end
  end

  task :db do
    app = ENV["app"] || "sandbox"
    Dir.chdir "../#{app}" do
      system("rake db:create")
    end
  end

  task :db_drop do
    app = ENV["app"] || "sandbox"
    Dir.chdir "../#{app}" do
      system("rake db:drop")
    end
  end

  task :test do
    app = ENV["app"] || "sandbox"
    Dir.chdir "../#{app}" do
      system("bundle exec rails generate rspec:install")
      system("mkdir spec/features")
      system("mkdir spec/models")
    end
    system("cp -f tinderbox/.rspec ../#{app}")
    system("cp -f tinderbox/spec_helper.rb ../#{app}/spec")
    system("cp -f tinderbox/rails_helper.rb ../#{app}/spec")
    system("cp tinderbox/user_feature_spec.rb ../#{app}/spec/features")
  end    

  task :guard do
    app = ENV["app"] || "sandbox"
    Dir.chdir "../#{app}" do
      system("guard init")
    end
  end

  task :open do
    app = ENV["app"] || "sandbox"
    Dir.chdir "../#{app}" do
      system("subl .")
    end
  end

  task :starter => [:app, :tinderbox, :bundle, :db, :test, :guard, :open]
  
  task :copy_secure do 
    app = ENV["app"] || "sandbox"
    system("cp -r secure ..")
    system("mv ../secure ../#{app}")
  end

  task :secure => [:copy_secure, :bundle, :db_drop, :open]

  task :copy_commerce do 
    app = ENV["app"] || "sandbox"
    system("cp -r commerce ..")
    system("mv ../commerce ../#{app}")
  end

  task :commerce => [:copy_commerce, :bundle, :db_drop, :open]
end