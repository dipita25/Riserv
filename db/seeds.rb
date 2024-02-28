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

enterprise1 = { name: 'Rajiv coiffure', address: 'Beau bassin-Rose Hill', user_id: users.first.id }
enterprise1 = Enterprise.create(enterprise1)
image_url_enterprise1 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1706148090/samples/imagecon-group.jpg"
enterprise1.photo.attach(io: URI.open(image_url_enterprise1), filename: "imagecon-group.jpg")

enterprise2 = { name: 'Drake shopping', address: 'Port louis', user_id: users.first.id }
enterprise2 = Enterprise.create(enterprise2)
image_url_enterprise2 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1706148091/samples/cloudinary-group.jpg"
enterprise2.photo.attach(io: URI.open(image_url_enterprise2), filename: "cloudinary-group.jpg")
puts "enterprises bien crées"

puts "creation des slots"
slots = Slot.create([
  { start_time: DateTime.now, end_time: DateTime.now + 1.hour, enterprise_id: enterprise1.id, status: 0 },
  { start_time: DateTime.now + 2.hours, end_time: DateTime.now + 3.hours, enterprise_id: enterprise1.id, status: 0 }
])
puts "slots bien créés "

puts "creation des services"
service1 = { title: 'coiffure homme', description: 'Description du service 1', enterprise_id: enterprise1.id, price: 3500 }
service1 = Service.create(service1)
image_url1 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1708754081/homme_dqtqp4.jpg"
service1.photo.attach(io: URI.open(image_url1), filename: "homme_dqtqp4.jpg")

service2 = { title: 'coiffure femme', description: 'Description du service 2', enterprise_id: enterprise2.id, price: 2500 }
service2 = Service.create(service2)
image_url2 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1708754081/femme_h9xnkn.jpg"
service2.photo.attach(io: URI.open(image_url2), filename: "femme_h9xnkn.jpg")
puts "services bien créés"

puts "creation des reservations"
reservations = Reservation.create([
  { user_id: users.first.id, slot_id: slots.first.id, service_id: service1.id, status: 1 },
  { user_id: users.first.id, slot_id: slots.second.id, service_id: service1.id, status: 1  }
])
puts "reservations bien créees"

puts "creation des reviews"
reviews = Review.create([
  { content: 'Avis sur l\'entreprise 1', user_id: users.first.id, enterprise_id: enterprise1.id },
  { content: 'Avis sur l\'entreprise 2', user_id: users.second.id, enterprise_id: enterprise2.id }
])
puts "reviews bien créées"
