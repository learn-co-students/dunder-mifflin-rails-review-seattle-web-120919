class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit]

    def index
        @employees = Employee.all 
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else 
            render 'new'
        end
    end

    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to @employee
        else
            render :edit
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end
end
