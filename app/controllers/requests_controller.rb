class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!,
    :only => [:destroy,  :index]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

def status 
@request = Request.find(params[:id])

if params[:email] != @request.email
redirect_to index_dashboard_url, alert: 'Invalid Request Email, please enter email used to submit booking' 

else

  end

end 

  # GET /requests/1
  # GET /requests/1.json
  def show
      #:authenticate_user!
  end

  # GET /requests/new
  def new
  @request = Request.new
  @comp = 'all'

  end

  # GET /requests/1/edit
  def edit
    
  end

  # POST /requests
  # POST /requests.json
  def create
    @staff =  Staff.where("email= '#{params[:request][:email]}'")[0]
    #request.staff.id = @staff.id
      if @staff.nil?
        #redirect_back fallback_location: new_request_url
       redirect_to new_request_url, alert: "Email Record not found, contact Admin for registration"
      else
         # request.staff.id = @staff.id
      if @cross_platform_error  
      redirect_to new_request_url, alert: "Company/location incorrect, contact Admin"
      else
     @request = Request.new(request_params)
    respond_to do |format|
      if @request.save
        format.html { redirect_to index_dashboard_url, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
        RequestMailer.newreq(@request).deliver
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end  #end of respond format to save
        end #cross platform check 
        end  #end check if staff is nil 
  end
  def check_crossplatform
    @room = Room.where("id= #{params[:room]}").first
      @staff =  Staff.where("email= '#{session[:email]}'").first  

      if @staff.location == @room.location

        if @staff.company == @room.company
          @cross_platform_error = false
        else
          if @staff.crossplatform 
            @cross_platform_error = false
          else
            if @room.company == 'HQ'
              @cross_platform_error = false
            else
            @cross_platform_error = true
            end
          end
        end
      else
        if @staff.crossplatform 
            @cross_platform_error = false
          else
            @cross_platform_error = true
          end
      end

  end 
  def check_email
    @f = Request.new
    @staff =  Staff.where("email= '#{params[:email]}'").first
    if !@staff.nil? 
         @comp = 'all'
             session[:email] = @staff.email
      email = @staff.email.split('@')[1].split('.')[0]
      if email == 'natural-prime'
        @comp = 'NPRNL'
      elsif email == 'esrnl'
        @comp == 'ESRNL'
      elsif email == 'primerafood-nigeria'
        @comp = 'PFNL'  
        end              
    else

    end

        respond_to do |format|
         format.js
      end 
  end
  def check_attendees
  @r = Room.where("id= #{params[:room_id]}").first
  att = params[:attendees].to_i
    if att > @r.capacity
    @attendees_error = "Room capacity(#{@r.capacity}) exceeded, choose more convenient room. !"

    elsif att <= 6 && @r.capacity - att > 15
    @attendees_error = "Room capacity(#{@r.capacity}) under utilized, choose room with less capacity. !"
    end
  end

  def check_schedule
   @date = Date.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i
   @start = Time.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i,params["startd(4i)"].to_i, params["startd(5i)"].to_i
   @end = Time.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i,params["endd(4i)"].to_i, params["endd(5i)"].to_i
   # @date_error = Time.parse(params[:my_date]) 
   if @date >= Date.today
    @date_err = false
    if @start.hour == @end.hour
      if @end.min <= @start.min
        @time_error = "Incorrect duration check time range!"
        @time_err = true
      elsif @end.min - @start.min < 10
        @time_error = "Invalid duration, must be greater than 10 minutes!"
        @time_err = true
      else
      end
    end #end date OK but same hour chosen 
      if @start.hour<8 || @end.hour>17  #time should be within working hours
        @time_error = "Invalid time, not within working hours!"
        @time_err = true
      else
        @res = Request.where("date= ? and room_id= ?", @date, params[:room_id])
        @time_err = false
        @res.each{ |f|
          if @start.hour.between?(f.startd.hour, f.endd.hour)
              @date_error = "Room scheduled, choose another time/room!"
              @time_err = true
            if @start.hour==f.endd.hour
              if @start.min-f.endd.min <= 10
                @time_error = "Time conflict, Must start 10minute after Previous schedule!"
                  @time_err = true
                else
              @time_error = ""
              @time_err = false
              end
            else
              @date_error = "Room scheduled, choose another time/room!"
              @time_err = true
            end

          elsif @end.hour.between?(f.startd.hour, f.endd.hour)
            @time_err=true
             @date_error = "Room scheduled, choose another time/room!"
    
          end
        }
      end  #Time within working hours and checking time conflicts
    else
   @date_error = "Invalid date, must be today or greater"
   @date_err = true
    
    end # end check if date past or invalid

  end
  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
            if @request.status == 'approved'
            RequestMailer.approved(@request).deliver
          elsif @request.status == 'reschedule'
            if user_signed_in?
            RequestMailer.reschedule(@request).deliver
          else
            RequestMailer.reminder(@request).deliver
          end
          elsif @request.status == 'rejected'
            RequestMailer.rejected(@request).deliver
          elsif @request.status == 'pending'
            RequestMailer.reminder(@request).deliver
          end 
              
        if user_signed_in?

              
        format.html { redirect_to admin_index_url, notice: 'Request was successfully updated.' }
        else
        format.html { redirect_to index_dashboard_url, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      end 
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request

       @request = Request.find(params[:id])
    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      
      params.require(:request).permit(:title, :date, :startd, :endd, :desc, :requestby,
       :email, :reschedule, :room_id, :staff_id, :projector, :refreshment, :special, :attendees, :status, :approval, :final, :remarks)
    end



end
