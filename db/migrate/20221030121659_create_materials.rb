class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.integer :recipe_d_id, null: false
      t.string :material_name, null: false
      t.string :quantity, null: false


      t.timestamps
    end
  end
end
