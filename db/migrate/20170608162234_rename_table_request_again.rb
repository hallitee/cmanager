class RenameTableRequestAgain < ActiveRecord::Migration[5.0]
  def change
  	  	execute "ALTER TABLE RequestOldTable RENAME TO requests"
  end
end
