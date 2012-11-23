class ProjectRequestsController < ApplicationController
  # GET /project_requests
  # GET /project_requests.json
  def index
    @project_requests = ProjectRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_requests }
    end
  end

  # GET /project_requests/1
  # GET /project_requests/1.json
  def show
    @project_request = ProjectRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_request }
    end
  end

  # GET /project_requests/new
  # GET /project_requests/new.json
  def new
    @project_request = ProjectRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_request }
    end
  end

  # GET /project_requests/1/edit
  def edit
    @project_request = ProjectRequest.find(params[:id])
  end

  # POST /project_requests
  # POST /project_requests.json
  def create
    @project_request = ProjectRequest.new(params[:project_request])

    respond_to do |format|
      if @project_request.save
        format.html { redirect_to @project_request, notice: 'Project request was successfully created.' }
        format.json { render json: @project_request, status: :created, location: @project_request }
      else
        format.html { render action: "new" }
        format.json { render json: @project_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_requests/1
  # PUT /project_requests/1.json
  def update
    @project_request = ProjectRequest.find(params[:id])

    respond_to do |format|
      if @project_request.update_attributes(params[:project_request])
        format.html { redirect_to @project_request, notice: 'Project request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_requests/1
  # DELETE /project_requests/1.json
  def destroy
    @project_request = ProjectRequest.find(params[:id])
    @project_request.destroy

    respond_to do |format|
      format.html { redirect_to project_requests_url }
      format.json { head :no_content }
    end
  end
end
