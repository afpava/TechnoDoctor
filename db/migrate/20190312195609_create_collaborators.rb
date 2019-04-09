class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :avatar
      t.integer :user_id
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
