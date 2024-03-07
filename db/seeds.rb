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
Favorite.destroy_all
Reservation.destroy_all
Review.destroy_all
Slot.destroy_all
Service.destroy_all
Enterprise.destroy_all
User.destroy_all
puts "Vidange terminée"

puts "creation des users"
users = User.create([
  { email: 'jonathan@gmail.com', password: '123456', username: 'jonathan' },
  { email: 'edwin@gmail.com', password: '123456', username: 'edwin'  },
  { email: 'test@gmail.com', password: '123456', username: 'george'  }
])
puts "users bien créés"

puts "creation des enterprises"

enterprise1 = { name: 'Rajiv coiffure', address: 'Beau bassin-Rose Hill', description: "Entreprise du secteur de la coiffure et propose des prestations extraordinaires",
                 user_id: users.first.id }
enterprise1 = Enterprise.create(enterprise1)
image_url_enterprise1 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709650176/rajiv_a7tbjv.png"
enterprise1.photo.attach(io: URI.open(image_url_enterprise1), filename: "rajiv_a7tbjv.png")

enterprise2 = { name: 'Pet Consult', address: 'Port louis', description: "Entreprise opérant dans le secteur vétérinaire et propose des prestations extraordinaires", user_id: users.first.id }
enterprise2 = Enterprise.create(enterprise2)
image_url_enterprise2 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709147455/pet_ndplu7.jpg"
enterprise2.photo.attach(io: URI.open(image_url_enterprise2), filename: "pet_ndplu7.jpg")

enterprise3 = { name: 'Neelesh Consulting', address: 'cap malheureux', description: "Entreprise opérant dans le secteur de la santé et propose des prestations extraordinaires",
  user_id: users.first.id }
enterprise3 = Enterprise.create(enterprise3)
image_url_enterprise3 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709147455/clinic_o8lsnv.webp"
enterprise3.photo.attach(io: URI.open(image_url_enterprise3), filename: "clinic_o8lsnv.jpg")

enterprise4 = { name: 'Dentist Moris', address: 'rose hill beau-bassin', description: "Entreprise opérant dans le secteur dentaire et propose des prestations extraordinaires", user_id: users.first.id }
enterprise4 = Enterprise.create(enterprise4)
image_url_enterprise4 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709147455/dentist_d02reg.jpg"
enterprise4.photo.attach(io: URI.open(image_url_enterprise4), filename: "_d02reg.jpg")
puts "enterprises bien crées"

puts "creation des slots"
slots1 = Slot.create([
  { start_time: DateTime.new(2024,3,25,8,0,0), end_time: DateTime.new(2024,3,25,8,59,0), enterprise_id: enterprise1.id, status: 1 },
  { start_time: DateTime.new(2024,3,25,9,0,0), end_time: DateTime.new(2024,3,25,9,59,0), enterprise_id: enterprise1.id, status: 1 },
  { start_time: DateTime.new(2024,3,25,10,0,0), end_time: DateTime.new(2024,3,25,10,59,0), enterprise_id: enterprise1.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,11,0,0), end_time: DateTime.new(2024,3,25,11,59,0), enterprise_id: enterprise1.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,12,0,0), end_time: DateTime.new(2024,3,25,12,59,0), enterprise_id: enterprise1.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,14,0,0), end_time: DateTime.new(2024,3,25,14,59,0), enterprise_id: enterprise1.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,15,0,0), end_time: DateTime.new(2024,3,25,15,59,0), enterprise_id: enterprise1.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,16,0,0), end_time: DateTime.new(2024,3,25,16,59,0), enterprise_id: enterprise1.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,17,0,0), end_time: DateTime.new(2024,3,25,17,59,0), enterprise_id: enterprise1.id, status: 0 },
])


slots2 = Slot.create([
  { start_time: DateTime.new(2024,3,25,8,0,0), end_time: DateTime.new(2024,3,25,8,59,0), enterprise_id: enterprise2.id, status: 1 },
  { start_time: DateTime.new(2024,3,25,9,0,0), end_time: DateTime.new(2024,3,25,9,59,0), enterprise_id: enterprise2.id, status: 1 },
  { start_time: DateTime.new(2024,3,25,10,0,0), end_time: DateTime.new(2024,3,25,10,59,0), enterprise_id: enterprise2.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,11,0,0), end_time: DateTime.new(2024,3,25,11,59,0), enterprise_id: enterprise2.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,12,0,0), end_time: DateTime.new(2024,3,25,12,59,0), enterprise_id: enterprise2.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,14,0,0), end_time: DateTime.new(2024,3,25,14,59,0), enterprise_id: enterprise2.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,15,0,0), end_time: DateTime.new(2024,3,25,15,59,0), enterprise_id: enterprise2.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,16,0,0), end_time: DateTime.new(2024,3,25,16,59,0), enterprise_id: enterprise2.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,17,0,0), end_time: DateTime.new(2024,3,25,17,59,0), enterprise_id: enterprise2.id, status: 0 },
])


slots3 = Slot.create([
  { start_time: DateTime.new(2024,3,25,8,0,0), end_time: DateTime.new(2024,3,25,8,59,0), enterprise_id: enterprise3.id, status: 1 },
  { start_time: DateTime.new(2024,3,25,9,0,0), end_time: DateTime.new(2024,3,25,9,59,0), enterprise_id: enterprise3.id, status: 1 },
  { start_time: DateTime.new(2024,3,25,10,0,0), end_time: DateTime.new(2024,3,25,10,59,0), enterprise_id: enterprise3.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,11,0,0), end_time: DateTime.new(2024,3,25,11,59,0), enterprise_id: enterprise3.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,12,0,0), end_time: DateTime.new(2024,3,25,12,59,0), enterprise_id: enterprise3.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,14,0,0), end_time: DateTime.new(2024,3,25,14,59,0), enterprise_id: enterprise3.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,15,0,0), end_time: DateTime.new(2024,3,25,15,59,0), enterprise_id: enterprise3.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,16,0,0), end_time: DateTime.new(2024,3,25,16,59,0), enterprise_id: enterprise3.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,17,0,0), end_time: DateTime.new(2024,3,25,17,59,0), enterprise_id: enterprise3.id, status: 0 },
])


slots4 = Slot.create([
  { start_time: DateTime.new(2024,3,25,8,0,0), end_time: DateTime.new(2024,3,25,8,59,0), enterprise_id: enterprise4.id, status: 1 },
  { start_time: DateTime.new(2024,3,25,9,0,0), end_time: DateTime.new(2024,3,25,9,59,0), enterprise_id: enterprise4.id, status: 1 },
  { start_time: DateTime.new(2024,3,25,10,0,0), end_time: DateTime.new(2024,3,25,10,59,0), enterprise_id: enterprise4.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,11,0,0), end_time: DateTime.new(2024,3,25,11,59,0), enterprise_id: enterprise4.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,12,0,0), end_time: DateTime.new(2024,3,25,12,59,0), enterprise_id: enterprise4.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,14,0,0), end_time: DateTime.new(2024,3,25,14,59,0), enterprise_id: enterprise4.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,15,0,0), end_time: DateTime.new(2024,3,25,15,59,0), enterprise_id: enterprise4.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,16,0,0), end_time: DateTime.new(2024,3,25,16,59,0), enterprise_id: enterprise4.id, status: 0 },
  { start_time: DateTime.new(2024,3,25,17,0,0), end_time: DateTime.new(2024,3,25,17,59,0), enterprise_id: enterprise4.id, status: 0 },
])
puts "slots bien créés"

puts "creation des services"
service1 = { title: 'coiffure homme', description: 'Description du service 1', enterprise_id: enterprise1.id, price: 3500 }
service1 = Service.create(service1)
image_url1 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709143413/development/skubwcxnhy5bl4g29w1907oezgjm.jpg"
service1.photo.attach(io: URI.open(image_url1), filename: "skubwcxnhy5bl4g29w1907oezgjm.jpg")

service2 = { title: 'coiffure femme', description: 'Description du service 2', enterprise_id: enterprise1.id, price: 2500 }
service2 = Service.create(service2)
image_url2 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1708754081/femme_h9xnkn.jpg"
service2.photo.attach(io: URI.open(image_url2), filename: "femme_h9xnkn.jpg")

service3 = { title: 'Lavage', description: 'Nous prenons soin de votre animal de compagnie', enterprise_id: enterprise2.id, price: 2500 }
service3 = Service.create(service3)
image_url3 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709651047/lavage_ciqe8i.jpg"
service3.photo.attach(io: URI.open(image_url3), filename: "lavage_ciqe8i.jpg")

service4 = { title: 'Stérilisation', description: 'Nous stérilisons votre animal pour éviter les mauvaises surprises', enterprise_id: enterprise2.id, price: 2500 }
service4 = Service.create(service4)
image_url4 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709651285/steriliser_scbjwa.jpg"
service4.photo.attach(io: URI.open(image_url4), filename: "steriliser_scbjwa.jpg")

service5 = { title: 'consultation générale', description: 'pensez à nous pour vos consultations', enterprise_id: enterprise3.id, price: 2500 }
service5 = Service.create(service5)
image_url5 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709651421/consultation_sx4qsj.jpg"
service5.photo.attach(io: URI.open(image_url5), filename: "consultation_sx4qsj.jpg")

service6 = { title: 'petite chirurgie', description: 'Tout le nécessaire pour vos petites chirurgies c\'est chez nous', enterprise_id: enterprise3.id, price: 2500 }
service6 = Service.create(service6)
image_url6 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709651898/chirurgie_sywmnf.jpg"
service6.photo.attach(io: URI.open(image_url6), filename: "chirurgie_sywmnf.jpg")

service7 = { title: 'blanchiment dentaire', description: 'Nous vous redonnerons le sourire', enterprise_id: enterprise4.id, price: 2500 }
service7 = Service.create(service7)
image_url7 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709652537/blanchiment_bkle1u.jpg"
service7.photo.attach(io: URI.open(image_url7), filename: "blanchiment_bkle1u.jpg")

service8 = { title: 'soin de carries', description: 'Nous vous débarrassons de vos carries', enterprise_id: enterprise4.id, price: 2500 }
service8 = Service.create(service8)
image_url8 = "https://res.cloudinary.com/dhyxhfi5d/image/upload/v1709652665/carrie_w16njd.jpg"
service8.photo.attach(io: URI.open(image_url8), filename: "carrie_w16njd.jpg")
puts "services bien créés"

puts "creation des reservations"
reservations = Reservation.create([
  { user_id: users.first.id, slot_id: slots1.first.id, service_id: service1.id, status: 1 },
  { user_id: users.first.id, slot_id: slots1.second.id, service_id: service2.id, status: 1  },
  { user_id: users.first.id, slot_id: slots2.first.id, service_id: service3.id, status: 1  },
  { user_id: users.first.id, slot_id: slots2.second.id, service_id: service4.id, status: 1  },
  { user_id: users.first.id, slot_id: slots3.first.id, service_id: service5.id, status: 1  },
  { user_id: users.first.id, slot_id: slots3.second.id, service_id: service6.id, status: 1  },
  { user_id: users.first.id, slot_id: slots4.first.id, service_id: service7.id, status: 1  },
  { user_id: users.first.id, slot_id: slots4.second.id, service_id: service8.id, status: 1  }
])
puts "reservations bien créees"

puts "creation des reviews"
reviews = Review.create([
  { content: 'je recommande vraiment cet endroit, l\'accueil est très professionnel et les prix sont abordables', user_id: users.first.id, enterprise_id: enterprise1.id },
  { content: 'Si vous avez des doutes, alors croyez moi sur parole, n\'y allez pas. le service y est très affreux', user_id: users.second.id, enterprise_id: enterprise1.id },
  { content: 'Je pense que vous ne vous rendrez plus jamais dans cet endroit', user_id: users.second.id, enterprise_id: enterprise2.id },
  { content: 'allez-y uniquement si vous avez de envie de pleurer car le service est deplorable', user_id: users.second.id, enterprise_id: enterprise2.id },
  { content: 'trop sombre endroit', user_id: users.second.id, enterprise_id: enterprise3.id },
  { content: 'allez-y uniquement si vous avez de envie de pleurer car le service est deplorable', user_id: users.second.id, enterprise_id: enterprise3.id },
  { content: 'allez-y uniquement si vous avez de envie de pleurer car le service est deplorable', user_id: users.second.id, enterprise_id: enterprise4.id },
  { content: 'Si vous avez des doutes, alors croyez moi sur parole, n\'y allez pas. le service y est très affreux', user_id: users.second.id, enterprise_id: enterprise4.id }
])
puts "reviews bien créées"
