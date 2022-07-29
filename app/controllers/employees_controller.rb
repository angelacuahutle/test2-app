class EmployeesController < ApplicationController
  # before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees or /employees.json
  def index
    @employees = Employee.all.order('created_at DESC')
    @employee = Employee.new(employee_params)
  end

  # GET /employees/1 or /employees/1.json
  def show; end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  def preview
    @preview_employee = Employee.new(employee_params)
    respond_to do |format|
      redirect_to request.url, notice: @preview_employee.errors.full_messages unless @preview_employee.valid?
      format.turbo_stream
    end
  end

  # GET /employees/1/edit
  def edit; end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)
    @employee.first_name = personal_data_params[:first_name]
    @employee.last_name = personal_data_params[:last_name]
    @employee.email = personal_data_params[:email]
    @employee.password = personal_data_params[:password]

    respond_to do |format|
      if @employee.save!
        format.html { redirect_to root_path, notice: 'Employee was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_url(@employee), notice: 'Employee was successfully updated.' }
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
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def personal_data
    %i[first_name last_name email password].each do |param|
      session[param] = params[:employee][param]
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :phone_number,
      :date_employment_started,
      :employment,
      :date_employment_ended
    )
  end

  def personal_data_params
    h = {}
    %i[first_name last_name email password].each do |param|
      h[param] = session[param]
    end
    h
  end
end
