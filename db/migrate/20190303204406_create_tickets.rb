class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.float :orient_price
      t.integer :prepayment
      t.integer :stage,default: 0, null: false
      t.date :in_date
      t.date :orient_date
      t.references :customer, foreign_key:true
      t.references :device, foreign_key:true
      t.references :collaborator, foreign_key:true
      t.float :total_price

      t.timestamps
    end
  end
end
