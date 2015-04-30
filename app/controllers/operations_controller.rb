class OperationsController < ApplicationController
  def index
    @operation_form = OperationForm.new(operation_form_params)
    @operations = @operation_form.operations
  end

  def search
    operation = Operation.find_by(searchable_params)
    render json: operation
  end

  def new
    @operation = Operation.new
  end

  def edit
    @operation = Operation.find(params[:id])
  end

  def show
    @operation = Operation.find(params[:id])
    respond_to do |format|
      format.json { render json: @operation }
    end
  end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      redirect_to operations_path, notice: 'created'
    else
      render :new
    end
  end

  def update
    @operation = Operation.find(params[:id])
    if @operation.update(operation_params)
      redirect_to operations_path, notice: 'updated'
    else
      render :edit
    end
  end

  private

  def operation_params
    params.require(:operation).permit!
  end

  def operation_form_params
    params.fetch(:operation_form, {}).permit!
  end

  def searchable_params
    params.slice(:target_url, :name)
  end
end
