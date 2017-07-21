class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

   before_filter :set_timezone

 def set_timezone
   Time.zone = 'West Central Africa'
 end

end
