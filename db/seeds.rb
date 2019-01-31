# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

=begin
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
=end


#create 40 cities

40.times do
    city = City.create!(name: Faker::Address.city)
end

#create 40 specialities

40.times do
    speciality = Speciality.create!(name: Faker::LordOfTheRings.character)
end

#create 40 doctors

40.times do
    doctor = Doctor.create!(first_name: Faker::LordOfTheRings.character, last_name: Faker::Beer.style, city: City.all.sample, speciality: Speciality.all.sample, postal_code: Faker::Address.zip)
end

#create 40 patients

40.times do
    patient = Patient.create!(first_name: Faker::LordOfTheRings.character, last_name: Faker::Beer.style, city: City.all.sample)
end

# #create 40 appointments

40.times do
    appointment = Appointment.create!(date: Faker::Date.between(120.days.ago, Date.today), doctor: Doctor.all.sample, patient: Patient.all.sample, city: City.all.sample)
end
