class IndexController < ApplicationController

	protect_from_forgery with: :exception

	respond_to :json


def get_events
#@r =  Request.where("room_id=? and status=?", params[:room_id], "approved")
@r =  Request.where("room_id=?", params[:room_id])
events= []
@r.each do |task|
start=task.date.year.to_s+'-'+task.date.month.to_s+'-'+task.date.day.to_s+'T'+task.startd.hour.to_s+':'+task.startd.min.to_s+':00-01:00'
start=start.to_time.iso8601
endd=task.date.year.to_s+'-'+task.date.month.to_s+'-'+task.date.day.to_s+'T'+task.endd.hour.to_s+':'+task.endd.min.to_s+':00-01:00'
endd = endd.to_time.iso8601

#start = Time.new(task.date.year, task.date.month, task.date.day, task.startd.hour, task.startd.min)
#endd = Time.new(task.date.year, task.date.month, task.date.day, task.endd.hour, task.endd.min)
	events << { :id => "#{task.id}", :title => "#{task.name}", :start => 
	"#{start}", :end => "#{endd}"  }
end
#render plain: events.to_json
    respond_to do |format|
      #format.html # index.html.erb
      format.json { render json: events }
    end
end



  def dashboard
    if user_signed_in?
    @email=current_user.email
    @staff = Staff.where("email=?", @email).first
    @r = Room.all
  end 
  CheckCompletedRequestJob.perform_later
  end
  def test
  end
  
end
