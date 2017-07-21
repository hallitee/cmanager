require 'csv'

namespace :gsnl_user do
  desc "TODO"
  task user_task: :environment do

 csv_file_path = 'db/GSNLUSER.csv'

    CSV.foreach(csv_file_path) do |row|
      if row.length > 3  #wanted to ignore some straggling data and blank spaces in the file
        User.create!({
          :email => row[0],
          :password => row[1],
          :password_confirmation => row[2],  
          :admin => row[3] ,  
          :superadmin => row[4]    
        })
        puts "Row added!"
      end

  end

  end

end
