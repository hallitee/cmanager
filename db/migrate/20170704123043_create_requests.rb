class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.date :date
      t.time :startd
      t.time :endd
      t.text :desc
      t.string :requestby
      t.string :email
      t.date :reschedule
      t.boolean :projector
      t.boolean :refreshment
      t.text :special
      t.integer :attendees
      t.string :status
      t.string :approval
      t.string :final
      t.text :remarks
      t.references :staff, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
