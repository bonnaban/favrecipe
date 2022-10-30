class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :recipe_d_id, null: false
      t.string :title, null: false
      t.text :explanation, null: false

      t.timestamps
    end
  end
end
