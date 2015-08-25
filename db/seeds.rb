Job.destroy_all

10.times do
  Job.create!(company_name: Faker::Company.name,
              position_name: Faker::Name.title,
              application_sent: 5.minutes.ago,
              last_touch: 4.minutes.ago)
end

p "Created #{Job.count} jobs."
