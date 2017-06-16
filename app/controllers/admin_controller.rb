class AdminController < ApplicationController
  before_action :authenticate_user!


  def index
  	@request = Request.all.order(date: :asc)

	counts
  end
  def pending
  	counts
	@request = Request.where("status = 'pending'").order(date: :asc)
  	render :index
  end
  def approved
  	counts
  	@request = Request.where("status = 'approved'").order(date: :asc)
  	render :index
  end
  
  def reschedule
    counts
    @request = Request.where("status = 'reschedule'").order(date: :asc)
    render :index

  end 
  def 

  def list
  end

  def setting
  end

  def counts
  	@pending = Request.where("status = 'pending'").count
	@approved = Request.where(["date = ? and status = ?", "#{Date.today}", "approved"]).count
	@ongoing = Request.where("date = '#{Time.now}'").count
	@rejected = Request.where("status = 'rejected'").count
  end
end
