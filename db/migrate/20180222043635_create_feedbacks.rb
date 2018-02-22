class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.references :ratable, polymorphic: true
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
