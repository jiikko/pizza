class AutomationsController < ApplicationController
  def show
  end

  def create
    operation = Operation.find(params[:operation_id])
    automation = operation.automations.create
    redirect_to automation, notice: '作成しました'
  end
end
