class EmployeesController < ApplicationController

   before_filter :signed_in_employee, only: [:index, :edit, :update]
   before_filter :signed_in_employee, only: [:edit, :update]
   before_filter :correct_employee, only: [:edit, :update] 


  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
#@employee.password = params[:password]
    #@employee.save!
    #respond_to do |format|
      if @employee.save
       # format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
         sign_in @employee
         flash[:success] = "Welcome to Employee App"

         redirect_to @employee

         #format.html { redirect_to edit_employee_path @employee, notice: 'Employee was successfully created.' }
        #format.json { render json: @employee, status: :created, location: @employee }
      else
        render 'new'
       # format.html { render action: "new" }
       # format.json { render json: @employee.errors, status: :unprocessable_entity }
      end





     # if @employee.save
       # format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
      #  format.html { redirect_to edit_employee_path @employee, notice: 'Employee was successfully created.' }
      #  format.json { render json: @employee, status: :created, location: @employee }
     # else
      #  format.html { render action: "new" }
      #  format.json { render json: @employee.errors, status: :unprocessable_entity }
     # end
    #end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])
     if @employee.update_attributes(params[:employee])
        flash[:success] = "Profile updated"
        #format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        #format.json { head :no_content }
        sign_in @employee
        redirect_to @employee
      else
        render 'edit'
        #format.html { render action: "edit" }
        #format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
   # respond_to do |format|
   #   if @employee.update_attributes(params[:employee])
   #     format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      #  format.json { head :no_content }
      #else
     #   format.html { render action: "edit" }
     #   format.json { render json: @employee.errors, status: :unprocessable_entity }
    #  end
   # end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private

    #def signed_in_employee
     # unless signed_in?
    #  store_location
    #  redirect_to signin_url, notice: "Please sign in." 
    #  end
 #   end
  
   def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_path) unless current_employee?(@employee)
    end




end
