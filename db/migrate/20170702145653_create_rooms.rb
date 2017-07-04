class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :codename
      t.string :company
      t.string :location
      t.integer :capacity
      t.string :condition
      t.string :status

      t.timestamps
    end
  end
end
