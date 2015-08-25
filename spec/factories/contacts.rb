FactoryGirl.define do
  factory :contact do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :with_salutation do
      salutation { Faker::Name.prefix }
    end

    trait :with_company do
      company
    end

    trait :with_phone do
      main_phone { Faker::PhoneNumber.phone_number }
    end

    trait :with_all_phones do
      main_phone { Faker::PhoneNumber.phone_number }
      second_phone { Faker::PhoneNumber.cell_phone }
    end

    trait :with_email do
      email { Faker::Internet.email(first_name) }
    end

    factory :contact_with_salutation, traits: [:with_salutation]
    factory :contact_with_company, traits: [:with_company]
    factory :contact_with_all_info, traits: [:with_salutation,
                                             :with_company,
                                             :with_email,
                                             :with_all_phones]
  end
end
