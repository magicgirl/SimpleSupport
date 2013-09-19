class CreateTicketComments < ActiveRecord::Migration
  def change
    create_table :ticket_comments do |t|
      t.text :message
      t.belongs_to :ticket, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
