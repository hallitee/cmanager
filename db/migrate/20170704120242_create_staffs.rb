class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :location
      t.integer :priviledge
      t.boolean :crossplatform

      t.timestamps
    end
  end
end
