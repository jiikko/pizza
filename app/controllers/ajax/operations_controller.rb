class Ajax::OperationsController < ApplicationController
  def index
    @operations = Operation.all
    render json: { operations: @operations }
  end
end
