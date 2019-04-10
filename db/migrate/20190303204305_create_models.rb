class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.string :description
      t.references :brand, foreign_key:true

      t.timestamps
    end
  end
end
