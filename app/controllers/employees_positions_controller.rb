class EmployeesPositionsController < ApplicationController
  # GET /employees_current_positions
  # GET /employees_current_positions.json
  def index
    @employees_current_positions = EmployeesPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees_current_positions }
    end
  end

  # GET /employees_current_positions/1
  # GET /employees_current_positions/1.json
  def show
    @employees_current_position = EmployeesPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employees_current_position }
    end
  end

  # GET /employees_current_positions/new
  # GET /employees_current_positions/new.json
  def new
    @employees_current_position = EmployeesPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employees_current_position }
    end
  end

  # GET /employees_current_positions/1/edit
  def edit
    @employees_current_position = EmployeesPosition.find(params[:id])
  end

  # POST /employees_current_positions
  # POST /employees_current_positions.json
  def create
    @employees_current_position = EmployeesPosition.new(params[:employees_current_position])

    respond_to do |format|
      if @employees_current_position.save
        format.html { redirect_to @employees_current_position, notice: 'Employees current position was successfully created.' }
        format.json { render json: @employees_current_position, status: :created, location: @employees_current_position }
      else
        format.html { render action: "new" }
        format.json { render json: @employees_current_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees_current_positions/1
  # PUT /employees_current_positions/1.json
  def update
    @employees_current_position = EmployeesPosition.find(params[:id])

    respond_to do |format|
      if @employees_current_position.update_attributes(params[:employees_current_position])
        format.html { redirect_to @employees_current_position, notice: 'Employees current position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employees_current_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees_current_positions/1
  # DELETE /employees_current_positions/1.json
  def destroy
    @employees_current_position = EmployeesPosition.find(params[:id])
    @employees_current_position.destroy

    respond_to do |format|
      format.html { redirect_to employees_current_positions_url }
      format.json { head :no_content }
    end
  end
end
