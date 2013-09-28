class EmployeesPrevPositionsController < ApplicationController
  active_scaffold :"employees_prev_position" do |conf|
    conf.columns = [
      :position_name,
      :department_name,
      :salary,
      :rate,
      :start_date,
      :end_date,
      :employee
    ]    
    conf.columns[:employee].form_ui = :select
    conf.columns[:rate].options = {
      min: 0.1,
      max: 1.0,
      step: 0.1
    }
  end
end

class EmployeesPrevPositionsDetailsController < ApplicationController

  before_filter :authenticate_user!

  # GET /employees_prev_positions
  # GET /employees_prev_positions.json
  def index
    @employees_prev_positions = EmployeesPrevPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees_prev_positions }
    end
  end

  # GET /employees_prev_positions/1
  # GET /employees_prev_positions/1.json
  def show
    @employees_prev_position = EmployeesPrevPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employees_prev_position }
    end
  end

  # GET /employees_prev_positions/new
  # GET /employees_prev_positions/new.json
  def new
    @employees_prev_position = EmployeesPrevPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employees_prev_position }
    end
  end

  # GET /employees_prev_positions/1/edit
  def edit
    @employees_prev_position = EmployeesPrevPosition.find(params[:id])
  end

  # POST /employees_prev_positions
  # POST /employees_prev_positions.json
  def create
    @employees_prev_position = EmployeesPrevPosition.new(params[:employees_prev_position])

    respond_to do |format|
      if @employees_prev_position.save
        format.html { redirect_to @employees_prev_position, notice: 'Employees prev position was successfully created.' }
        format.json { render json: @employees_prev_position, status: :created, location: @employees_prev_position }
      else
        format.html { render action: "new" }
        format.json { render json: @employees_prev_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees_prev_positions/1
  # PUT /employees_prev_positions/1.json
  def update
    @employees_prev_position = EmployeesPrevPosition.find(params[:id])

    respond_to do |format|
      if @employees_prev_position.update_attributes(params[:employees_prev_position])
        format.html { redirect_to @employees_prev_position, notice: 'Employees prev position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employees_prev_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees_prev_positions/1
  # DELETE /employees_prev_positions/1.json
  def destroy
    @employees_prev_position = EmployeesPrevPosition.find(params[:id])
    @employees_prev_position.destroy

    respond_to do |format|
      format.html { redirect_to employees_prev_positions_url }
      format.json { head :no_content }
    end
  end
end
