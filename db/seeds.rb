# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "root@root.fr", password: "rootroot", password_confirmation: "rootroot", firstname: "Prénom", lastname: "Nom", status: "visitor individual", admin: true)
User.create(email: "user@user.fr", password: "rootroot", password_confirmation: "rootroot", firstname: "Prénom", lastname: "Nom", status: "visitor professional")
User.create(email: "test@user.fr", password: "rootroot", password_confirmation: "rootroot", firstname: "Prénom", lastname: "Nom", status: "visitor")
