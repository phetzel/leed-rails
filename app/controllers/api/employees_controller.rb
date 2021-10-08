class Api::EmployeesController < ApplicationController
    def index
        employees = Employee.all
        employees = employees.each { |employee| employee[:image] = url_for(employee.photo) }
        render json: employees
    end 

    def create
        employee = Employee.new(employee_params)
        if employee.save
            render json: employee
        else 
            render json: employee.errors.full_messages, status: 422
        end
    end 

    def update 
        employee = Employee.find(params[:id])
        if employee.update(employee_params)
            render json: employee
        else  
            render json: employee.errors.full_messages, status: 422
        end
    end

    def destroy
        employee = Employee.find(params[:id])
        employee.destroy
        employees = Employee.all
        render json: employees
    end

    private
    def employee_params 
        params.require(:employee).permit(
            :id,
            :name,
            :title,
            :description,
            :image
        )
    end 
end
