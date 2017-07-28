class ChangeStartdTypeInRequests < ActiveRecord::Migration[5.0]
  def change
  	change_column :requests, :startd, :timestamp
  	change_column :requests, :endd, :timestamp  	
  end
end
