class OperationsController < ApplicationController
  def index
    @operations = Operation.all
  end

  def new
    @operation = Operation.new
  end

  def edit
  end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      redirect_to operations_path, notice: 'created'
    else
      render :new
    end
  end


  private

  def operation_params
    params.require(:operation).permit!
  end
end
