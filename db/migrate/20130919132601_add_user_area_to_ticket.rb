class AddUserAreaToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :support_area_id, :integer
  end
end
