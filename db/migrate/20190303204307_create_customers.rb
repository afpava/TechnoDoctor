class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name, index: true
      t.string :last_name, index: true
      t.string :phone_number, index: true
      t.integer :user_id

      t.timestamps
    end
  end
end
