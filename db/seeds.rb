# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Speciality.destroy_all

5.times do 
    city = City.create!(
      name: Faker::Address.city)
end

5.times do 
  doctor = Doctor.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    #speciality: ["generalist","chirurgien","dentiste","optalmologue","cancerologue"].sample,
    zipcode: Faker::Address.zip_code,
    city_id: City.all.sample.id)
end

10.times do
  speciality = Speciality.create!(
    name:["generalist","chirurgien","dentiste","ophtalmologue","cancerologue"].sample )
end
  
10.times do 
    patient = Patient.create!(
      first_name: Faker::Name.first_name, 
      last_name: Faker::Name.last_name,
      city_id: City.all.sample.id)
end

   
10.times do 
    appointment = Appointment.create!(
      date: Faker::Date.in_date_period(month: 12),
      doctor_id: Doctor.all.sample.id,
      patient_id: Patient.all.sample.id,
      city_id: City.all.sample.id)
end


10.times do
    join_table_specialities_doctor = JoinTableSpecialitiesDoctor.create!(
      doctor: Doctor.all.select(:id).sample,
      speciality: Speciality.all.select(:id).sample)
end
  

puts "Faker a généré sa dummy data !"