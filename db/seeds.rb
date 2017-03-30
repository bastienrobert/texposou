# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

type = ["artist", "professional", "particular", "visitor"]
rank = 1;
type.each do |t|
  status = t
  if t == "visitor"
    status = ""
  end
  User.create(
  email: t+"@"+t+".com",
  password: t+t,
  password_confirmation: t+t,
  firstname: t+"_firstname",
  lastname: t+"_lastname",
  main_status: t,
  status: status,
  admin: true)

  Place.create(
    name: "Chez "+t,
    description: "Sed at tortor quam. Vestibulum feugiat scelerisque placerat. Integer vitae pharetra lorem, ut dignissim leo. Praesent nec condimentum felis, non accumsan dui. Praesent ut convallis elit, ac laoreet tortor. Vestibulum eu pretium sapien. Morbi vitae odio ac tortor dapibus imperdiet. Cras egestas, sapien sit amet euismod elementum, lorem ex sagittis justo, vel consequat est neque id nibh. Praesent eu velit magna. Nullam vel est blandit, blandit ipsum nec, aliquet nulla.",
    address: "13 allee du "+t,
    zipcode: 33000,
    city: "Bordeaux",
    user_id: rank
  )
  Exhibition.create(
    name: "Event "+t,
    description: "Sed at tortor quam. Vestibulum feugiat scelerisque placerat. Integer vitae pharetra lorem, ut dignissim leo. Praesent nec condimentum felis, non accumsan dui. Praesent ut convallis elit, ac laoreet tortor. Vestibulum eu pretium sapien. Morbi vitae odio ac tortor dapibus imperdiet. Cras egestas, sapien sit amet euismod elementum, lorem ex sagittis justo, vel consequat est neque id nibh. Praesent eu velit magna. Nullam vel est blandit, blandit ipsum nec, aliquet nulla.",
    place_id: rank
  )
  rank+=1
end
