Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

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
    resolve -> (obj, args, ctx) { OrderItem.all }
  end

  field :allFeedbacks, !types[Types::FeedbackType] do
    resolve -> (obj, args, ctx) { Feedback.all }
  end

  field :orders, !types[Types::DeliveryOrderType] do
    resolve -> (obj, args, ctx) { DeliveryOrder.all }
  end

  field :order do
    type Types::DeliveryOrderType
    argument :order_id, !types.String
    resolve -> (obj, args, ctx) {
      DeliveryOrder.find_by_order_id(args["order_id"])
    }
  end

  field :feedbacks, types[Types::FeedbackType] do
    argument :order_id, !types.String
    resolve -> (obj, args, ctx) {
      feedbacks_for_order = []
      dOrder = DeliveryOrder.find_by_order_id(args["order_id"])
      feedbacks_for_order << dOrder.feedback

      dOrder.order_items.each { |order| feedbacks_for_order << order.feedback unless order.feedback.nil? }

      feedbacks_for_order
    }
  end
end
