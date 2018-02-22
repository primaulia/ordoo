# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Meal.destroy_all
DeliveryOrder.destroy_all
OrderItem.destroy_all
Feedback.destroy_all

10.times do
  Meal.create(
    name: Faker::Food.dish,
    description: Faker::Food.spice
  )
end

5.times do
  random_date = Faker::Date.forward(30)
  delivery_slots = (0...6).to_a.sample

  created_order = DeliveryOrder.create(
    order_id: "GO#{rand(999)}",
    serving_datetime: random_date + 11.hours + (delivery_slots * 30).minutes
  )

  2.times do
    random_meal = Meal.all.sample
    created_order.order_items.create(
      meal_id: random_meal.id,
      quantity: rand(1..3),
      unit_price: rand(495...2000)
    )
  end
end

3.times do
  random_delivery_order = DeliveryOrder.all.sample

  Feedback.create(
    ratable_id: random_delivery_order.id,
    ratable_type: 'DeliveryOrder',
    rating: [1, -1].sample,
    comment: "YOYO"
  )

  random_order_item = random_delivery_order.order_items.all.sample

  Feedback.create(
    ratable_id: random_order_item.id,
    ratable_type: 'OrderItem',
    rating: [1, -1].sample,
    comment: "XOXO"
  )
end
