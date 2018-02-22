Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  field :upvote, function: Functions::CreateFeedback.new(model_class: Feedback, type: Types::FeedbackType)
end
