Types::OrderItemType = GraphQL::ObjectType.define do
  name "OrderItem"
  field :id, !types.ID
  field :delivery_order, -> { Types::DeliveryOrderType }, property: :delivery_order
  field :meal, -> { Types::MealType }, property: :meal
  field :quantity, types.Int
  field :unit_price, types.Int
  field :total_price, types.Int do
    resolve -> (obj, args, ctx) {
      obj.unit_price * obj.quantity
    }
  end
end
