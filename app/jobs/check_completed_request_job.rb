class CheckCompletedRequestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @r = Request.where("date<?", Date.today)
    @r.each{|f| f.status='completed'
    	f.save
    }

  end
end
