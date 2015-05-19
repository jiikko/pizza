class Ajax::ServicesController < ApplicationController
  def exec
    klass = "::Service::#{params[:service_name].classify}".constantize
    instance = klass.new(params[:option])
    klass.params[:method]
    render json: { status: 200 }
  end
end
