class CreateJoinTableOperationTicket < ActiveRecord::Migration[5.2]
  def change
    create_join_table :operations, :tickets do |t|
      t.index [:operation_id, :ticket_id]
      # t.index [:ticket_id, :operation_id]
    end
  end
end
