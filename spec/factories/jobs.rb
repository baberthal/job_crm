FactoryGirl.define do
  factory :job do
    company
    application_sent { Faker::Date.backward(7) }
    last_touch { application_sent }
  end
end
