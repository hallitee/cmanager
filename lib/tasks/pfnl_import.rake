require 'csv'


namespace :pfnl_import do
  desc "Import PFNL data into database"
  task pfnl_task: :environment do

    csv_file_path = 'db/PFNL.csv'

    CSV.foreach(csv_file_path) do |row|
      if row.length > 2 #wanted to ignore some straggling data and blank spaces in the file
        Staff.create!({
          :name => row[0],
          :email => row[1],
          :company => row[2],  
          :location => row[3]      
        })
        puts "Row added!"
      end
    end
  end

end
