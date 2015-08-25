[Job, Contact, Company].each do |model|
  p "Destroying #{model.count} #{pluralize(model.count, model.to_s}"
  model.destroy_all
end

10.times do
  Company.create!(name: Faker::Company.name,
                 street_address: Faker::Address.street_address,
                 street_address_2: Faker::Address.secondary_address,
                 city:  Faker::Address.city,
                 state: Faker::Address.state_abbr,
                 postal_code: Faker::Address.postcode)

  Job.create!(company: Company.last,
              position_name: Faker::Name.title,
              application_sent: 5.minutes.ago,
              last_touch: 4.minutes.ago)

  Contact.create!(company: Company.last,
                  salutation: Faker::Name.prefix,
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  title: Faker::Name.title,
                  main_phone: Faker::PhoneNumber.phone_number,
                  second_phone: Faker::PhoneNumber.cell_phone,
                  email: Faker::Internet.email(first_name))
end

p "Created #{Company.count} companies."
p "Created #{Job.count} jobs."
p "Created #{Contact.count} contacts."
