class CreateSupportAreas < ActiveRecord::Migration
  def change
    create_table :support_areas do |t|
      t.string :title
      t.string :identifier

      t.timestamps
    end
  end
end
