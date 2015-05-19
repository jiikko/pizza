class AutomationsController < ApplicationController
  # ビルド結果を見る
  def show
    @automation = Automation.find(params[:automation_id])
  end

  def create
    operation = Operation.find(params[:operation_id])
    automation = operation.automations.create
    redirect_to automation, notice: '作成しました'
  end
end
