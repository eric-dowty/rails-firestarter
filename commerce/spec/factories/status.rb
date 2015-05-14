FactoryGirl.define do

  factory :ordered, class: Status do
    name 'ordered'
  end

  factory :cancelled, class: Status do
    name 'ordered'
  end
  
  factory :complete, class: Status do
    name 'ordered'
  end

  factory :paid, class: Status do
    name 'ordered'
  end

end