FactoryGirl.define do
  factory :contact_event do
    contact_time { Time.zone.now }
  end
end
