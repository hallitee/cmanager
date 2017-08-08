class CreateConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :configs do |t|
      t.string :mgr_company
      t.string :mgr_location
      t.string :mgr_email
      t.integer :projector
      t.string :mgr_refreshment
      t.string :mgr_hr
      t.string :mgr_it
      t.integer :loc_resource1
      t.integer :loc_resource2

      t.timestamps
    end
  end
end
