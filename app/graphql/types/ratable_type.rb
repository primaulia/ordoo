Types::RatableType = GraphQL::UnionType.define do
  name "Ratable"
  possible_types [Types::DeliveryOrderType, Types::OrderItemType]
end
