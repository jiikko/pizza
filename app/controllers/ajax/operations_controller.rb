class Ajax::OperationsController < ApplicationController
  def index
    @operations = Operation.all
    render json: { operations: @operations }
  end

  # TODO I/Fがまだふわとろ
  def find
    # Operation.find_by(name: params[:service_name])
    # Operation.find_by(name: params[:method])
  end
end
