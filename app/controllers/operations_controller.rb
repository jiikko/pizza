class OperationsController < ApplicationController
  def index
    @operation_form = OperationForm.new
    @operations = @operation_form.operations
  end

  def new
    @operation = Operation.new
  end

  def edit
    @operation = Operation.find(params[:id])
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
end
