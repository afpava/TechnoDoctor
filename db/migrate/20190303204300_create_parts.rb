class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :description
      t.float :price
      t.integer :quantity
      t.references :ticket, foreign_key:true
      
      t.timestamps
    end
  end
end
