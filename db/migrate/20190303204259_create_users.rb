class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :nickname
      t.string :avatar
      t.string :first_name, index: true
      t.string :last_name, index: true
      t.string :password_digest
      t.date :birth_day
      t.string :uid
      t.string :provider
      t.string :phone_number, index: true
      t.integer :role
      t.integer :customer_id

      t.timestamps
    end
  end
end
