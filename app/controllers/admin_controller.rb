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
   @staff = Staff.where("email=?", @email)
   if params[:ps]=='booked'
       @request = Request.where("email=? AND status IN (?) ", @email, ['booked', 'reschedule']).paginate(:page => params[:page], :per_page=>10)
     elsif params[:ps]=='coming'
      @request = Request.where("startd >= ? AND email=? AND status IN (?) ",Time.now, @email, ['booked', 'reschedule']).paginate(:page => params[:page], :per_page=>10)
   else
   @request = Request.where("email=?", @email).paginate(:page => params[:page], :per_page=>10)
   end
   count1

  end
  def manager
    @email = current_user.email 
    @mgr = Staff.where("email=?", @email)
    #@request=Request.joins(:room).select("*").where(rooms: {company: 'NPRNL'})
   @request = Request.all.paginate(:page => params[:page], :per_page=>10)   
      if params[:ps]=='booked'
    @request = Request.where("status = 'booked' or status='reschedule'").order(date: :asc).paginate(:page => params[:page], :per_page=>10)
     elsif params[:ps]=='coming'
     @request = Request.where("date >= ? AND status=? or status= ?",Date.today, 'booked', 'reschedule').paginate(:page => params[:page], :per_page=>10)
   else
   @request = Request.all.paginate(:page => params[:page], :per_page=>10)  
   end 
   counts
  end 

  def pending
  counts
	@request = Request.where("status = 'booked'").order(date: :asc).paginate(:page => params[:page], :per_page=>10)
  	render :index
  end
  def approved
  	counts
     @request = Request.where("date > ?",Date.today).paginate(:page => params[:page], :per_page=>10)
  	#@request = Request.where("status = 'approved'").order(date: :asc).paginate(:page => params[:page], :per_page=>10)
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
  @pending = Request.where("status = 'booked' OR status='reschedule'").count
	@approved = Request.where("date = ? and status = ?", "#{Date.today}", "booked").count
	@ongoing = Request.where("date < ? AND status= ? OR status=?", Date.today+5.day, 'booked', 'reschedule').count
	@cancel = Request.where("status = 'cancelled'").count
  #@r = Room.joins(:requests).select("*").where(requests: {id: 12}).first

  end
    def count1
  @email = current_user.email
  @pending = Request.where("email=? AND status IN (?)", current_user.email, ['booked','reschedule']).count
  @approved = Request.where("date = ? and status IN (?) ", "#{Date.today}", ['booked', 'reschedule']).count
  @ongoing = Request.where("startd >= ? AND email=? AND status IN (?)", Time.now,@email,['booked', 'reschedule'] ).count
  @cancel = Request.where("email=? AND status = 'cancelled'", current_user.email ).count
  #@r = Room.joins(:requests).select("*").where(requests: {id: 12}).first
  CheckCompletedRequestJob.perform_later
  end
end
