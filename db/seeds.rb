# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


math = Subject.create(name: "mathematics", description: "")
history = Subject.create(name: "history", description: "")
english = Subject.create(name: "English", description: "")

subjects = [math, history, english]

15.times do 
	Teacher.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		phone: Faker::PhoneNumber.cell_phone,
		subject: subjects.sample,
		is_candidate: false
	)
end


3.times do
	Group.create(
		name: Faker::Company.name
	)
end

3.times do
	School.create(
		name: Faker::Company.name,
		address: Faker::Address.street_address,
		phone: Faker::PhoneNumber.cell_phone
	)
end

groups = Group.all
schools = School.all

30.times do
	Student.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		address: Faker::Address.street_address,
		phone_number: Faker::PhoneNumber.cell_phone,
		group: groups.sample,
		school: schools.sample
	)
end