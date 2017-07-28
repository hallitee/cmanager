class CreateConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :configs do |t|
      t.string :company
      t.string :p_custodian
      t.string :r_custodian
      t.integer :projector
      t.boolean :status

      t.timestamps
    end
  end
end
