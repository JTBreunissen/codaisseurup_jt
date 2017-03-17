Photo.delete_all
Category.delete_all
Event.delete_all
Profile.delete_all
User.delete_all

10.times do
  Category.create!(
    name: Faker::Hipster.word
    )
end

rock = Category.create! ({name:"Rock"})
dance = Category.create! ({name:"Dance"})
country= Category.create! ({name:"Country"})
classical= Category.create! ({name:"Classical"})
jazz= Category.create! ({name:"Jazz"})
hiphop= Category.create! ({name:"HipHop"})

user1 = User.create ( { email: "jantjarco@codaisseurup.com", password: "fakepassword"})

photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/dzp8l5ltr/image/upload/v1489670904/meeting_enxjuf.jpg")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/dzp8l5ltr/image/upload/v1489670904/lowlands2_my75b5.jpg")
photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/dzp8l5ltr/image/upload/v1489670904/lowlands_xn0fpm.jpg")

#def random_photo
#  randomphoto= "photo" + rand(7).to_s
#end


event1= Event.create!(
          name:Faker::Book.title,
          description:Faker::Hipster.paragraph,
          location:Faker::Address.city,
          capacity: Faker::Number.between(15, 1000),
          includes_food: Faker::Boolean.boolean,
          includes_drinks: Faker::Boolean.boolean,
          price: Faker::Number.decimal(2),
          starts_at: 10.days.from_now,
          ends_at: 12.days.from_now,
          active:true,
          user: user1,
          categories: [rock, dance],
          photos: [photo1]
        )
end

event2= Event.create!(
          name:Faker::Book.title,
          description:Faker::Hipster.paragraph,
          location:Faker::Address.city,
          capacity: Faker::Number.between(15, 1000),
          includes_food: Faker::Boolean.boolean,
          includes_drinks: Faker::Boolean.boolean,
          price: Faker::Number.decimal(2),
          starts_at: 10.days.from_now,
          ends_at: 12.days.from_now,
          active:true,
          user: user1,
          categories: [rock, dance],
          photos: [photo2]
        )
end

event3= Event.create!(
          name:Faker::Book.title,
          description:Faker::Hipster.paragraph,
          location:Faker::Address.city,
          capacity: Faker::Number.between(15, 1000),
          includes_food: Faker::Boolean.boolean,
          includes_drinks: Faker::Boolean.boolean,
          price: Faker::Number.decimal(2),
          starts_at: 10.days.from_now,
          ends_at: 12.days.from_now,
          active:true,
          user: user1,
          categories: [rock, dance],
          photos: [photo3]
        )
end

Registration.create([
  { event: event1, user: user1, price: event.price, registered_at: 2.days.ago, guests_count: 1 },
  { event: event2, user: user1, price: event.price, registered_at: 10.days.ago, guests_count: 3 },
])
