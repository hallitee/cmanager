class AdminController < ApplicationController
  before_action :authenticate_user!


  def index
  	@request = Request.all.order(date: :asc).paginate(:page => params[:page], :per_page=>10)

   # @request = Request.paginate(:page => params[:page], :per_page=>10)

	counts
  end
  def pending
  	counts
	@request = Request.where("status = 'pending'").order(date: :asc).paginate(:page => params[:page], :per_page=>10)
  	render :index
  end
  def approved
  	counts
  	@request = Request.where("status = 'approved'").order(date: :asc).paginate(:page => params[:page], :per_page=>10)
  	render :index
  end
  
  def reschedule
    counts
    @request = Request.where("status = 'reschedule'").order(date: :asc).paginate(:page => params[:page], :per_page=>10)
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
	@ongoing = Request.where("date < ? AND status= ?", Date.today+5.day, 'approved').count
	@rejected = Request.where("status = 'rejected'").count
  #@r = Room.joins(:requests).select("*").where(requests: {id: 12}).first

  end
end
