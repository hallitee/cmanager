class RenameTableRequest < ActiveRecord::Migration[5.0]
  def change
  	execute "ALTER TABLE requests RENAME TO RequestOldTable"
  end
end
