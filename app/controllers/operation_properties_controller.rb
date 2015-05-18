class OperationPropertiesController < ApplicationController
  def index
    @operation_properties = OperationProperty.where(user: current_user).scope_private
    @operation_properties = @operation_properties + OperationProperty.scope_public
  end

  def new
    @operation_property = OperationProperty.new
  end

  def edit
    @operation_property = OperationProperty.find(params[:id])
    render_404 unless owner?
  end

  def create
    @operation_property = OperationProperty.new(authentication_params)
    @operation_property.user = current_user
    if @operation_property.save
      redirect_to operation_properties_url, notice: '作成しました'
    else
      render :new
    end
  end

  def update
    @operation_property = OperationProperty.find(params[:id])
    render_404 unless owner?
    @operation_property.user = current_user
    if @operation_property.update(authentication_params)
      redirect_to operation_properties_url, notice: '認証情報を更新しました'
    else
      render :edit
    end
  end

  private

  def authentication_params
    params.require(:operation_property).
      permit([
        :scope,
        :service_name,
        :namespace,
        :key,
        :value,
        :masked
    ])
  end

  def owner?
    @operation_property.user == current_user
  end
end
