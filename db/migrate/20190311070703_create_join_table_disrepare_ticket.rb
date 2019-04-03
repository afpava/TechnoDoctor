class CreateJoinTableDisrepareTicket < ActiveRecord::Migration[5.2]
  def change
    create_join_table :disrepares, :tickets do |t|
      t.index [:disrepare_id, :ticket_id]
      # t.index [:ticket_id, :disrepare_id]
    end
  end
end
