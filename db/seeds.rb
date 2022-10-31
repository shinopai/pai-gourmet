images = [
  'img_resto01.jpg',
  'img_resto02.jpg',
  'img_resto03.jpg',
  'img_resto04.jpg',
  'img_resto05.jpg',
  'img_resto06.jpg',
  'img_resto07.jpg',
  'img_resto08.jpg',
  'img_resto09.jpg',
  'img_resto10.jpg',
  'img_resto11.jpg',
  'img_resto12.jpg',
  'img_resto13.jpg',
  'img_resto14.jpg',
  'img_resto15.jpg',
  'img_resto16.jpg',
  'img_resto17.jpg',
  'img_resto18.jpg',
  'img_resto19.jpg',
  'img_resto20.jpg'
]

3000.times do
  image_path = images[rand(0..(images.size - 1))]

  Restaurant.create!(
    name: Faker::Name.name,
    opening_date: Faker::Date.between(from: '1900-01-01', to: Date.today),
    phone: Faker::PhoneNumber.phone_number,
    remarks: Faker::Lorem.paragraph,
    image: File.open("./public/images/#{image_path}"),
    area_id: rand(1..Area.count),
    genre_id: rand(1..Genre.count)
  )
end
