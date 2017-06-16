class DropTablerequest < ActiveRecord::Migration[5.0]
  def change
  	execute "DROP TABLE requests"
  end
end
