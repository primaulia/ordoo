class OrderItem < ApplicationRecord
  belongs_to :delivery_order
  belongs_to :meal
  has_one :feedback, as: :ratable

  attribute :order_item_id, :integer
  attribute :meal_name, :string

  def order_item_id
    self.id
  end

  def meal_name
    self.meal.name
  end

  def as_json(options = {})
    options[:except] ||= [:order_item_id]

    super(options)
  end
end
