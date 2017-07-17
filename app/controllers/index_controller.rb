class IndexController < ApplicationController

	protect_from_forgery with: :exception

	respond_to :json


def get_events
@r =  Request.where("room_id=? and status=?", 1, "approved")
events= []
@r.each do |task|
start=task.date.year.to_s+'-'+task.date.month.to_s+'-'+task.date.day.to_s+'T'+task.startd.hour.to_s+':'+task.startd.min.to_s+':00'

endd =task.date.year.to_s+'-'+task.date.month.to_s+'-'+task.date.day.to_s

	events << {:id => "#{task.id}", :title => "#{task.title}", :start => 
	"#{start}", :end => "#{endd}"  }
end
render :text => events.to_json
end
  def dashboard
  	@r = Room.all
  end
  def test
  end
  
end
