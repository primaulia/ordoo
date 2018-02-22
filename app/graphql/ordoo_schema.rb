OrdooSchema = GraphQL::Schema.define do
  # mutation(Types::MutationType)
  query(Types::QueryType)
  resolve_type -> (type, obj, ctx) {
    # puts type
    # puts
    # puts obj.id
    # puts
    # puts ctx
    # puts
    # obj.instance_of? DeliveryOrder ? DeliveryOrder.find(obj.id) : OrderItem.find(obj.id)

    case obj
    when DeliveryOrder
      Types::DeliveryOrderType
    when OrderItem
      Types::OrderItemType
    end
  }
end
