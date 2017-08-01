class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
    #before_filter :authenticate_user!, :only => [:destroy,  :index]
@cross_platform_error = nil
  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

def status 
@request = Request.find(params[:id])
@all = Request.where("staff_id=?", @request.staff_id)
@staff = Staff.where("email=?", @request.email).first
@room = Room.where("id=?", @request.room_id).first
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
  logged_in
  @email = current_user.email
  @staff = Staff.where("email=?", @email).first
  @r = Room.all
  @request = Request.new
  @comp = 'all'

  end
def check_projector
   @date = Date.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i
   @start = Time.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i,params["startd(4i)"].to_i, params["startd(5i)"].to_i
   @end = Time.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i,params["endd(4i)"].to_i, params["endd(5i)"].to_i
   return "true"
end 
  # GET /requests/1/edit
  def edit
  logged_in
  #@staff= Staff.joins(:requests).select("*").where(requests: {id: params[:id]}).first
  end

  # POST /requests
  # POST /requests.json
  def create
    @staff =  Staff.where("email= '#{params[:request][:email]}'")[0]
    #request.staff.id = @staff.id
      if @staff.nil?
        #redirect_back fallback_location: new_request_url
       redirect_to new_request_url, alert: "Email Record not found, contact Admin for registration"

         # request.staff.id = @staff.id
      elsif session[:cross_platform_error]
      redirect_to new_request_url, alert: "Company/location incorrect, contact Admin."
      elsif session[:date_error]
      redirect_to new_request_url, alert: "Room Booked, choose another date!"
      elsif session[:time_error]
      redirect_to new_request_url, alert: "Check meeting duration, adjust start/stop time!" 
      elsif  session[:attendees_error]     
        redirect_to new_request_url, alert: "Please check Attendees, should be greater than zero !!" 
      else
       sy=params[:request]["date(1i)"].to_i
        sm=params[:request]["date(2i)"].to_i
        sd=params[:request]["date(3i)"].to_i
        sh=params[:request]["startd(4i)"].to_i
        smin=params[:request]["startd(5i)"].to_i        
        ey=params[:request]["date(1i)"].to_i
        em=params[:request]["date(2i)"].to_i
        ed=params[:request]["date(3i)"].to_i
        eh=params[:request]["endd(4i)"].to_i
        emin=params[:request]["endd(5i)"].to_i        
  @request = Request.new(request_params)
@request.startd = Time.new sy,sm,sd,sh,smin
@request.endd = Time.new ey,em,ed,eh,emin
    respond_to do |format|
      if @request.save
        format.html { redirect_to index_dashboard_url, notice: 'Request was successfully created.'}
        format.json { render :show, status: :created, location: @request }
        RequestMailer.delay.newreq(@request)
        if @request.projector
        RequestMailer.delay.projectormail(@request)
        end
        if @request.refreshment
        RequestMailer.delay.refreshmentmail(@request)
      end
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end  #end of respond format to save
        #end #cross platform check 
        end  #end check if staff is nil 
  end
  def check_crossplatform
    @email = current_user.email
    @room = Room.where("id= #{params[:room]}").first
      @staff =  Staff.where("email= ?", @email).first  
  if params[:act]!='reschedule'
      if !@staff.nil?
      if @staff.location == @room.location

        if @staff.company == @room.company
          @cross_platform_error = false
           session[:cross_platform_error] = false
        else
          if @staff.crossplatform 
            @cross_platform_error = false
             session[:cross_platform_error] = false
          else
            if @room.company == 'HQ' && @staff.priviledge == 1
              @cross_platform_error = false
              session[:cross_platform_error] = false
            else
            @cross_platform_error = true
            session[:cross_platform_error] = true
            end
          end
        end
      else
        if @staff.crossplatform 
            @cross_platform_error = false
             session[:cross_platform_error] = false
          else
            @cross_platform_error = true
            session[:cross_platform_error] = true
          end
      end   
    else
      #redirect_to new_request_url, alert: "Email cannot be empty!"

    end   #staff record must not be nil
  else
    @staff =  Staff.where("email= '#{params[:email]}'").first  
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
  @t = att
     if att >= 1
      session[:attendees_error]=false
        if att > @r.capacity
        @attendees_error = "Room capacity(#{@r.capacity}) exceeded, choose more convenient room. !"

        elsif att <= 6 && @r.capacity - att > 15
        @attendees_error = "Room capacity(#{@r.capacity}) under utilized, choose room with less capacity. !"
       end

    else
     @attendees_error =  "Please check Attendees, should be greater than zero !!"
    session[:attendees_error]=true

    end
end
    def check_schedule
   @date = Date.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i
   @start = Time.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i,params["startd(4i)"].to_i, params["startd(5i)"].to_i
   @end = Time.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i,params["endd(4i)"].to_i, params["endd(5i)"].to_i
   # @date_error = Time.parse(params[:my_date]) 
   if @date >= Date.today || !Date.today.sunday? 


              @date_err = false
              session[:date_error] = false
               session[:time_error] = false
        if @start.hour<8 || @start.hour>17 || @end.hour<8 || @end.hour>17  #time should be within working hours
        @time_error = "Invalid time, not within working hours!"
        @time_err = true
        session[:time_error] = true
      else

            if @start.hour == @end.hour
                  if @end.min <= @start.min
                        @time_error = "Incorrect duration check time range!"
                         @time_err = true
                         session[:time_error] = true
                   elsif @end.min - @start.min < 10
                          @time_error = "Invalid duration, must be greater than 10 minutes!"
                          @time_err = true
                         session[:time_error] = true
                   end
           elsif @date == Date.today
                    if @start.hour < Time.now.hour
                     @time_error = "Invalid time, time past please correct!"
                    session[:time_error] = true
                   end
          elsif @start.hour > @end.hour
                     @time_error = "Invalid time, please correct end time!"
                    session[:time_error] = true          
            end #end date OK but same hour chosen 

       
           
        @res = Request.where("date= ? and room_id= ?", @date, params[:room_id])
        @time_err = false
        #session[:time_error] = false
        @res.each{ |f|
          if @start.hour.between?(f.startd.hour, f.endd.hour)
              @date_error = "Room scheduled, choose another time/room!"
              @time_err =true
              @date_err = true
              session[:date_error] = true
            if @start.hour==f.endd.hour
              if @start.min-f.endd.min <= 10
                @time_error = "Time conflict, Must start 10minute after Previous schedule!"
                  @time_err = true
                  session[:time_error] = @time_err
                else
              @time_error = ""
              @time_err = false
              session[:time_error] = false
              end
            else
              @date_error = "Room scheduled, choose another time/room!"
              @time_err = true
              @date_err = true
              session[:date_error] = true
            end

          elsif @end.hour.between?(f.startd.hour, f.endd.hour)
            @time_err=true
            session[:date_err] = @time_err
             @date_error = "Room scheduled, choose another time/room!"
    
          end
        }
      end  #Time within working hours and checking time conflicts
    else
                           @date_error = "Invalid date, must be today or greater"
                           @date_err = true
                          session[:date_error] = true
    end # end check if date past or invalid

  end
  def check_schedule1
  @date = Date.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i
   @start = Time.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i,params["startd(4i)"].to_i, params["startd(5i)"].to_i
   @end = Time.new params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i,params["endd(4i)"].to_i, params["endd(5i)"].to_i
   # @date_error = Time.parse(params[:my_date]) 
   if @date >= Date.today
    @date_err = false
    session[:date_error] = false
    session[:time_error] = false
    if @start.hour == @end.hour
      if @end.min <= @start.min
        @time_error = "Incorrect duration check time range!"
        @time_err = true
        session[:time_error] = true
      elsif @end.min - @start.min < 10
        @time_error = "Invalid duration, must be greater than 10 minutes!"
        @time_err = true
        session[:time_error] = true
      end

    elsif @date == Date.today
      if @start.hour < Time.now.hour
      @time_error = "Invalid time, time past please correct!"
      session[:time_error] = true
      end

    end #end date OK but same hour chosen 
      if @start.hour<8 || @start.hour>17 || @end.hour<8 || @end.hour>17  #time should be within working hours
        @time_error = "Invalid time, not within working hours!"
        @time_err = true
        session[:time_error] = true
      else
        @res = Request.where("date= ? and room_id= ?", @date, params[:room_id])
        @time_err = false
        #session[:time_error] = false
        @res.each{ |f|
          if @start.hour.between?(f.startd.hour, f.endd.hour)
             if current_user.email != @res.email
              @date_error = "Room scheduled, choose another time/room!"
              @time_err =true
              @date_err = true
              session[:date_error] = true
            if @start.hour==f.endd.hour
              if @start.min-f.endd.min <= 10
                @time_error = "Time conflict, Must start 10minute after Previous schedule!"
                  @time_err = true
                  session[:time_error] = @time_err
                else
              @time_error = ""
              @time_err = false
              session[:time_error] = false
              end
            else
              @date_error = "Room scheduled, choose another time/room!"
              @time_err = true
              @date_err = true
              session[:date_error] = true
            end
          end 
          elsif @end.hour.between?(f.startd.hour, f.endd.hour)
            if current_user.email != res.email
            @time_err=true
            session[:date_err] = @time_err
             @date_error = "Room scheduled, choose another time/room!"
            end
          end
        }
      end  #Time within working hours and checking time conflicts
    else
   @date_error = "Invalid date, must be today or greater"
   @date_err = true
   session[:date_error] = true
    
    end # end check if date past or invalid

  end
  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @staff = current_user.email
    if params[:request][:status] == 'reschedule'
      params[:request][:status]= 'booked'    
      puts "reschedule"
      elsif params[:request][:status] == 'cancelled' 
        params[:request][:status] = 'cancelled'
        puts "cancelled"
    end
    if !params[:request]["date(1i)"].nil?
        params[:request]["startd(1i)"]=params[:request]["date(1i)"]
       params[:request]["startd(2i)"]=params[:request]["date(2i)"]
        params[:request]["startd(3i)"]=params[:request]["date(3i)"]   
        params[:request]["endd(1i)"]=params[:request]["date(1i)"]
        params[:request]["endd(2i)"]=params[:request]["date(2i)"]
        params[:request]["endd(3i)"]=params[:request]["date(3i)"]
    end
    if @staff.nil?
        #redirect_back fallback_location: new_request_url
       redirect_to new_request_url, alert: "Email Record not found, contact Admin for registration"

         # request.staff.id = @staff.id
      elsif session[:cross_platform_error]
       redirect_to (:back), alert: "Company/location incorrect, contact Admin."
      elsif session[:date_error]
      redirect_to (:back), alert: "Room Booked, choose another date!"
      elsif session[:time_error]
      redirect_to (:back),  alert: "Check meeting duration, adjust start/stop time!" 
      elsif  session[:attendees_error]     
         redirect_to (:back), alert: "Please check Attendees, should be greater than zero !!" 
      else
    respond_to do |format|

      if @request.update(request_params)
      if @request.status == 'reschedule'
            RequestMailer.reschedule(@request).deliver_later!(wait: 30.seconds)
          elsif @request.status == 'cancelled'
          RequestMailer.rejected(@request).deliver_later!(wait: 30.seconds)
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
    end #end respond to update

  end # if validations check 
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_url, notice: 'Request was successfully updated.' }
     # format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
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

def logged_in
    @email=current_user.email
    @staff = Staff.where("email=?", @email).first
    @room = Room.joins(:requests).select("*").where(requests: {id: params[:id]}).first
end


end
