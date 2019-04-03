class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name, index: true
      t.string :last_name, index: true
      t.string :phone_number, index: true
      t.integer :user_id
      t.references :ticket, foreign_key:true

      t.timestamps
    end
  end
end
