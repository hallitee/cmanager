class AdminController < ApplicationController
  before_action :authenticate_user!


  def index #superadmin
    if current_user.superadmin?
  	@request = Request.all.order(date: :asc).paginate(:page => params[:page], :per_page=>10)
    #@request = Request.paginate(:page => params[:page], :per_page=>10)
  elsif current_user.admin?
        #@email = current_user.email 
  #@request = Request.all.order(date: :asc).paginate(:page => params[:page], :per_page=>10)
      #counts
      redirect_to :controller => 'admin', :action => 'manager'
     # render :manager

  else
       @email = current_user.email
   @request = Request.where("email=?", @email).paginate(:page => params[:page], :per_page=>10)
   # render :user
   counts
    redirect_to :controller => 'admin', :action => 'user'
  end
      
	counts
  end
  def user
   @email = current_user.email
   if params[:ps]=='booked'
       @request = Request.where("status='booked' AND email=?", @email).paginate(:page => params[:page], :per_page=>10)
     elsif params[:ps]=='coming'
      @request = Request.where("date > ? AND email=?",Date.today, @email).paginate(:page => params[:page], :per_page=>10)
   else
   @request = Request.where("email=?", @email).paginate(:page => params[:page], :per_page=>10)
   end
   count1

  end
  def manager
    @email = current_user.email 
   @request = Request.all.paginate(:page => params[:page], :per_page=>10)    
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
	@cancel = Request.where("status = 'cancel'").count
  #@r = Room.joins(:requests).select("*").where(requests: {id: 12}).first

  end
    def count1
  @pending = Request.where("status=? and email=?", 'booked', current_user.email).count
  @approved = Request.where(["date = ? and status = ?", "#{Date.today}", "approved"]).count
  @ongoing = Request.where("date < ? AND status= ?", Date.today+5.day, 'booked').count
  @cancel = Request.where("email=? AND status = 'cancelled'", current_user.email ).count
  #@r = Room.joins(:requests).select("*").where(requests: {id: 12}).first

  end
end
