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
  end

  # GET /requests/1/edit
  def edit
    
  end

  # POST /requests
  # POST /requests.json
  def create
    @staff =  Staff.where("email= '#{params[:request][:email]}'")[0]

      if @staff.nil?
        redirect_back fallback_location: new_request_url
       # redirect_to new_request_url, alert: "Email Record not found"
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
    end
        end 
  end
  def check_email
    @staff =  Staff.where("email= '#{params[:email]}'").first

    #render js: "alert('The number is: #{@staff.name}')"
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
       :email, :reschedule, :projector, :refreshment, :special, :attendees, :status, :approval, :final, :remarks)
    end



end
