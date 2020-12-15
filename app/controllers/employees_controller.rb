class EmployeesController < ApplicationController

    before_action :current_employee, only: [:show, :edit, :update, :destroy]
    def index
        @employees = Employee.all
    end

    def show 
    end

    def new 
        @employee = Employee.new
    end

    def create 
        employee = Employee.create(employee_params)
        redirect_to employee_path(employee) #'/employees/#{employee.id}'
    end

    def edit 
    end

    def update 
        # find employee to be updated
        @employee = Employee.find(params[:id]) 
        @employee.update(employee_params)
        redirect_to @employee
     
    end

    def destroy
        @employee.destroy
        redirect_to employees_path
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :office, :title, :dog_id)
    end

    def current_employee
        @employee = Employee.find(params[:id])
    end
end
