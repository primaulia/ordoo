Types::DeliveryOrderType = GraphQL::ObjectType.define do
  name "DeliveryOrder"
  field :id, !types.ID
  field :order_id, !types.String
  field :serving_datetime, !types.String
  field :delivery_date, !types.String
  field :delivery_time, !types.String
  field :order_items, types[Types::OrderItemType], property: :order_items
end
