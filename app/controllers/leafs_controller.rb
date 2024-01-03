class LeafsController < ApplicationController
  before_action :set_employee
  before_action :set_leaf, only: %i[show edit update destroy]

  # GET /leafs or /leafs.json
  def index
    @leafs = Leaf.all
    @leaves = @employee.leafs
  end

  # GET /leafs/1 or /leafs/1.json
  def show
  end

  # GET /leafs/new
  def new
    @leaf = @employee.leafs.build
  end

  # GET /leafs/1/edit
  def edit
  end

  # POST /leafs or /leafs.json
  def create
    @leaf = @employee.leafs.build(leaf_params)

    respond_to do |format|
      if @leaf.save
        format.html { redirect_to leaf_url(@leaf), notice: "Leaf was successfully created." }
        format.json { render :show, status: :created, location: @leaf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leafs/1 or /leafs/1.json
  def update
    respond_to do |format|
      if @leaf.update(leaf_params)
        format.html { redirect_to leaf_url(@leaf), notice: "Leaf was successfully updated." }
        format.json { render :show, status: :ok, location: @leaf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leafs/1 or /leafs/1.json
  def destroy
    @leaf.destroy!

    respond_to do |format|
      format.html { redirect_to leafs_url, notice: "Leaf was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:employee_id])
      redirect_to root_path, alert: 'Employee not found' unless @employee

    end
    # Use callbacks to share common setup or constraints between actions.
    def set_leaf
      @leaf = Leaf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leaf_params
      params.require(:leaf).permit(:start_date, :end_date, :status, :reason, :employee_id)
    end
end
