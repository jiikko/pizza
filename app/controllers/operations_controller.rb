class OperationsController < ApplicationController
  def index
    @operation_form = OperationForm.new(operation_form_params)
    @operations = @operation_form.operations
  end

  def search
    operation = Operation.find_by(params.permit(:target_url, :name))
    if operation
      render json: { operation: operation }
    else
      head :not_found
    end
  end

  def new
    @operation = Operation.new
  end

  def edit
    @operation = Operation.find(params[:id])
  end

  def show
    respond_to do |format|
      format.json {
        render json: {
          operation: @operation,
          program: @operation.find_program_by_programing_language(name: params[:programing_language_name])
        }
      }
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

  def enable
    @operation = Operation.find(params[:id])
    @operation.update_column(:enable, true)
  end

  private

  def operation_params
    params.require(:operation).permit!
  end

  def operation_form_params
    params.fetch(:operation_form, {}).permit!
  end

  def find_operation
    query = { id: params[:id] }
    if params[:programing_language_name] == 'JavaScript'
      query.merge!(enable: true)
    end
    @operation = Operation.find_by!(query)
    @operation.update_column(:enable, false)
  end
end
