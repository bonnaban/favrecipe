class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :user_id, null: false
      t.integer :recipe_d_id, null: false
      t.float :star, null: false

      t.timestamps
    end
  end
end
