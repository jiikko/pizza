class OperationAuthenticationsController < ApplicationController
  def index
    @operation_authentications = OperationAuthentication.where(user: current_user).scope_private
    @operation_authentications = @operation_authentications + OperationAuthentication.scope_public
  end

  def new
    @operation_authentication = OperationAuthentication.new
  end

  def edit
    @operation_authentication = OperationAuthentication.find(params[:id])
    render_404 unless owner?
  end

  def create
    @operation_authentication = OperationAuthentication.new(authentication_params)
    @operation_authentication.user = current_user
    if @operation_authentication.save
      redirect_to operation_authentications_url, notice: '作成しました'
    else
      render :new
    end
  end

  def update
    @operation_authentication = OperationAuthentication.find(params[:id])
    render_404 unless owner?
    @operation_authentication.user = current_user
    if @operation_authentication.update(authentication_params)
      redirect_to operation_authentications_url, notice: '認証情報を更新しました'
    else
      render :edit
    end
  end

  private

  def authentication_params
    params.require(:operation_authentication).
      permit([
        :scope,
        :service_name,
        :key,
        :value,
        :masked
    ])
  end

  def owner?
    @operation_authentication.user == current_user
  end
end
