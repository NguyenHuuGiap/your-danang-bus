# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  Route.create(name: "Tuyen-so-#{i}", start_time: 7,
               stop_time: 22, frequence: 20)
end

routes = Route.all

BASE_LAT = 16.0881844
BASE_LNG = 108.21656859999999

30.times do |i|
  bs = BusStop.create(name: "Tram-dung-#{i}",
                      latitude: BASE_LAT + rand(0.01 * i..0.1 * i),
                      longitude: BASE_LNG + rand(0.01 * i..0.1 * i))
  bs.routes << routes[rand(0..5)]
  bs.routes << routes[rand(5..9)]
end

bus_stops = BusStop.all
count = 0
routes.each do |route|
  route.bus_stops = bus_stops[count, 8]
  count += 2
end

20.times do |i|
  bus = Bus.create(number_plate: "BIEN-SO-#{i}")
  bus.route = routes[rand(0..9)]
  bus.save
end