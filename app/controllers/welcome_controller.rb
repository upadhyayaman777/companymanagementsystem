class WelcomeController < ApplicationController
  def index
    @current_employee = current_employee

    # If an employee is logged in, fetch their details
    if @current_employee
      @employees = [@current_employee] # Display only the currently logged-in employee
    else
      @employees = [] 
  end

  def show
  end
end
end
