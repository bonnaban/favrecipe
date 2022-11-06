class CreateRecipeDs < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ds do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :explanation, null: false
      t.integer :time, null: false
      t.integer :people, null: false

      t.timestamps
    end
  end
end
