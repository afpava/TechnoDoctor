class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.string :description
      t.float :price
      t.references :category, foreign_key:true


      t.timestamps
    end
  end
end
