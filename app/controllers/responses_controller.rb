class ResponsesController < ApplicationController
  # GET /responses
  # GET /responses.json
  def index
  
 @project_request = ProjectRequest.find(params[:project_request_id])
 @responses = @project_request.responses
#@employees = Employee.find(params[:id])
 #@employee = Employee.find_all_by_employee_id(@employees)

 #@employee = Employee.find(:employee_id)
   #@response = @project_request.responses.build
    #@responses = Response.all
    #@responses = @project_request.responses #new one
#@responses = Response.find_all_by_project_request_id(@project_request)
  @employees = Employee.all
  #@employee = Employee.find_by_id(@employees)

  # @employee = Employee.find_by_employee_id(:id)
   #employeeid = Responseemployee.find(:employee_id) 
   #@employee = Employee.find(employeeid) 

   #@employee = Employee.find(@employee)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
   
   #@project_request = ProjectRequest.find(params[:project_request_id])
   #@response = @project_request.responses.build
   @project_request = ProjectRequest.find(params[:project_request_id])
    #@response = @project_request.responses.build
    #@response = @project_request.responses.build(params[:response_id])
   @response = Response.find(params[:id])
    #@response = Response.new(:project_request=>@project_request)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.json
  def new
   #@project_request_id = ProjectRequest.find(params[:id])
    #@project_request = ProjectRequest.find(params[:project_request_id]) old one
    @project_request = ProjectRequest.find(params[:project_request_id])
   #@response = @project_request.build.responses
    @response = @project_request.responses.build
    #respond_with(@response)
    #@response = Response.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/1/edit
  def edit
        @project_request = ProjectRequest.find(params[:project_request_id])
     #@response = Response.find(params[:id])
        #@response = @project_request.responses.build(params[:response_id])
         @response = Response.find(params[:id])
  end

  # POST /responses
  # POST /responses.json
  def create
   @project_request = ProjectRequest.find(params[:project_request_id])
    @response = @project_request.responses.build(params[:response])
   # @project_request_id = ProjectRequest.find(params[:id])
   # @project_request = ProjectRequest.find(params[:project_request_id])
    #@response = @project_request.create_response
    @employees = Employee.all
    #@response = @project_request.responses.new(params[:response_id])
     #@response = @project_request.responses.build(params[:response_id])old one
   # @response = @project_request.responses.build.(params[:response])
    #@response = Response.new(params[:response])

    respond_to do |format|
      if @response.save
       # format.html { redirect_to project_request_responses_path @project_request, notice: 'Response was successfully created.' }
       # format.html { redirect_to project_request_response_path(@project_request, @response), notice: 'Response was successfully created.' }
         format.html { redirect_to project_request_responses_path @project_request, notice: 'Response was successfully created.' }
        #format.html { redirect_to @response, notice: 'Response was successfully created.' }
        #format.html  redirect_to {@project_request, @response}, notice: 'Response was successfully created.' 
       # format.html { redirect_to project_request_response_path (@response.project_request_id), notice: 'Response was successfully created.' }
        format.json { render json: @response, status: :created, location: @response }
      else
        format.html { render action: "new" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
   end
  end

  # PUT /responses/1
  # PUT /responses/1.json
  def update

    @project_request = ProjectRequest.find(params[:project_request_id])
    #@response = Response.find(params[:id])
   @response = Response.find(params[:id])
    #@response = @project_request.responses.build(params[:response_id])
    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to project_request_response_path(@project_request, @response), notice: 'Response was successfully updated.' }
        #format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @project_request = ProjectRequest.find(params[:project_request_id])
     #@response = @project_request.responses.build(params[:response])
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to project_request_responses_path(@project_request) }
     # format.html { redirect_to responses_url }
      format.json { head :no_content }
    end
  end
end
