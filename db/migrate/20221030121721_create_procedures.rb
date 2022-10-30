class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :procedures do |t|
      t.integer :recipe_d_id, null: false
      t.string :procedure_explanation, null: false

      t.timestamps
    end
  end
end
