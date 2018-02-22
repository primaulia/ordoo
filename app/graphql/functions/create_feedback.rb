FeedbackPayloadObjectType = GraphQL::InputObjectType.define do
  name "FeedbackPayload"
  input_field :ratable_id,    !types.String
  input_field :ratable_type,  !types.String
  input_field :rating,        !types.Int
  input_field :comment,       !types.String
end

Types::Status = GraphQL::ObjectType.define do
  name "Status"
  field :status, !types.String
end

class Functions::CreateFeedback < GraphQL::Function
  # Define `initialize` to store field-level options, eg
  #
  #     field :myField, function: Functions::CreateFeedback.new(type: MyType)
  #
  attr_reader :type
  def initialize(model_class:, type:)
    @model_class = model_class
    @type = type
  end

  # add arguments by type:
  # argument :feedbacks, !types[!FeedbackPayloadObjectType]

  type !Types::Status

  # Resolve function:
  def call(obj, args, ctx)
    payload = args[:feedbacks]

    {
      status: 'OK'
    }
  end
end
