# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# reservation = Reservation.new({user_id: 1, service_id: 1, slot_id: 1})
# reservation.save
# puts "DONE"

puts "Vidange de la BD"
Reservation.destroy_all
Review.destroy_all
Slot.destroy_all
Service.destroy_all
Enterprise.destroy_all
User.destroy_all
puts "Vidange terminée"

puts "creation des users"
users = User.create([
  { email: 'jonathan@gmail.com', password: '123456' },
  { email: 'daren@gmail.com', password: '123456' }
])
puts "users bien créés"

puts "creation des enterprises"
enterprises = Enterprise.create([
  { name: 'Entreprise 1', address: 'Adresse 1', user_id: users.first.id },
  { name: 'Entreprise 2', address: 'Adresse 2', user_id: users.second.id }
])
puts "enterprises bien crées"

puts "creation des slots"
slots = Slot.create([
  { start_time: DateTime.now, end_time: DateTime.now + 1.hour, enterprise_id: enterprises.first.id, status: 1 },
  { start_time: DateTime.now + 2.hours, end_time: DateTime.now + 3.hours, enterprise_id: enterprises.first.id, status: 1 }
])
puts "slots bien créés "

# Créer des services
# services = Service.create([
#   { title: 'Service 1', description: 'Description du service 1', enterprise_id: enterprises.first.id  },
#   { title: 'Service 2', description: 'Description du service 2', enterprise_id: enterprises.second.id }
# ])

puts "creation des services"
service1 = { title: 'Service 1', description: 'Description du service 1', enterprise_id: enterprises.first.id, price: 3500 }
service1 = Service.create(service1)
image_url1 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1706148104/samples/shoe.jpg"
service1.photo.attach(io: URI.open(image_url1), filename: "shoe.jpg")

service2 = { title: 'Service 2', description: 'Description du service 2', enterprise_id: enterprises.first.id, price: 2500 }
service2 = Service.create(service2)
image_url2 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1706148106/samples/breakfast.jpg"
service2.photo.attach(io: URI.open(image_url2), filename: "breakfast.jpg")
puts "services bien créés"

puts "creation des reservations"
reservations = Reservation.create([
  { user_id: users.first.id, slot_id: slots.first.id, slot_id: slots.first.id, service_id: service1.id, status: 1 },
  { user_id: users.first.id, slot_id: slots.second.id, slot_id: slots.second.id, service_id: service1.id, status: 1  }
])
puts "reservations bien créees"

puts "creation des reviews"
reviews = Review.create([
  { content: 'Avis sur l\'entreprise 1', user_id: users.first.id, enterprise_id: enterprises.first.id },
  { content: 'Avis sur l\'entreprise 2', user_id: users.second.id, enterprise_id: enterprises.second.id }
])
puts "reviews bien créées"
