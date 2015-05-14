FactoryGirl.define do
  
  factory :user do
    email     'default@user.com'
    role      0
    password  'password'
  end

  factory :admin, class: User do
    email     'admin@user.com'
    role      1
    password  'password'
  end

end