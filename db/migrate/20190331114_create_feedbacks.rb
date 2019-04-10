class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.string :title
      t.text :text
      t.integer :status, default: 0, null: false
      t.references :user, foreign_key:true

      t.timestamps
    end
  end
end
