Types::FeedbackType = GraphQL::ObjectType.define do
  name "Feedback"
  field :ratable, -> { Types::RatableType }
  field :rating, types.Int
  field :comment, types.String
end
