class CheckCompletedRequestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @r = Request.where("endd < ?", Time.now)
    @r.each{|f| f.status='completed'
    	f.save
    }

  end
end
