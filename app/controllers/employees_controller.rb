class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update, :destroy]

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

    private 
    
    def employee_params
        params.require(:employee).permit(:title, :first_name, :last_name, :alias, :office, :dog_id)
    end

	def find_employee
		@employee = Employee.find(params[:id])
	end
end
