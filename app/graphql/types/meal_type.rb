Types::MealType = GraphQL::ObjectType.define do
  name "Meal"
  field :id, !types.ID
  field :name, !types.String
  field :description, !types.String
end
