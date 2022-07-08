class EmployeesController < ApplicationController
  before_action :ensure_frame_response, only: [:new, :edit]


  # GET /employees or /employees.json
  def index
    @employees = Employee.all
    @employee = Employee.new
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
  end

  # GET /employees/1/edit
  def edit
  end

  def personal_data
    @employee.first_name = params[:first_name]
    @employee.last_name = params[:last_name]
    @employee.email = params[:email]
    @employee.password = params[:password]
    @employee.phone_number = params[:phone_number]
  end

  def employment_data
    @employee.date_employment_started = params[:date_employment_started]
    @employee.employment = params[:employment]
    @employee.date_employment_ended = params[:date_employment_ended]
  end

  # POST /employees or /employees.json
  def create
    respond_to do |format|
      if @employee.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@employee, partial: "personal_data", locals: {employee: @employee}) }
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@employee, partial: "personal_data", locals: {employee: @employee}) }
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:id, :first_name, :last_name, :email, :password, :phone_number, :date_employment_started, :employment, :date_employment_ended)
    end
    
    def ensure_frame_response
      return unless Rails.env.development?
      redirect_to root_path unless turbo_frame_request?
    end
end
