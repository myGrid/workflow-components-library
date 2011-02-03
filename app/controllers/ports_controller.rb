class PortsController < ApplicationController
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  
  def index
    @ports = Port.all
  end

  def show
    @port = Port.find(params[:id])
  end

  def new
    @component = Component.find(params[:component_id])
    @port = Port.new
  end

  def create
    @port = Port.new(params[:port])
    @port.usage_type = (params[:port][:usage_type] == 'input' ? :input : :output)       # FIXME!
    if @port.save
      flash[:notice] = "Successfully created port."
      redirect_to component_url(@port.component, :anchor => "ports")
    else
      @component = Component.find(@port.component_id)
      render :action => 'new'
    end
  end

  def edit
    @port = Port.find(params[:id])
  end

  def update
    @port = Port.find(params[:id])
    if @port.update_attributes(params[:port])
      flash[:notice] = "Successfully updated port."
      redirect_to port_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @port = Port.find(params[:id])
    @port.destroy
    flash[:notice] = "Successfully destroyed port."
    redirect_to ports_url
  end
end
