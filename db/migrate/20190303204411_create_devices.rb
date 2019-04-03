class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.references :category, foreign_key:true
      t.references :brand, foreign_key:true
      t.references :model, foreign_key:true
      t.string :serial_num, index: true
      t.string :imei, index: true
      t.references :ticket, foreign_key:true

      t.timestamps
    end
  end
end
