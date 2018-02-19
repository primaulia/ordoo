Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :allLinks, !types[Types::LinkType] do
    resolve -> (obj, args, ctx) { Link.all }
  end

  field :allMeals, !types[Types::MealType] do
    resolve -> (obj, args, ctx) { Meal.all }
  end

  field :allDeliveryOrders, !types[Types::DeliveryOrderType] do
    resolve -> (obj, args, ctx) { DeliveryOrder.all }
  end

  field :allOrders, !types[Types::OrderItemType] do
    
  end
end
