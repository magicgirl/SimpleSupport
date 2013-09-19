class CreateSupportAreasUsers < ActiveRecord::Migration
  def change
    create_table :support_areas_users, :id => false do |t|
      t.integer :support_area_id
      t.integer :user_id
    end

    add_index :support_areas_users, [:support_area_id, :user_id]
  end
end
