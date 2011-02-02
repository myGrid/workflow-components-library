class ComponentsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]
  
  load_and_authorize_resource
  
  def index
    @components = Component.all
  end

  def show
    @component = Component.find(params[:id])
  end

  def new
    @component = Component.new
  end

  def create
    @component = Component.new(params[:component])
    if @component.save
      flash[:notice] = "Successfully created component."
      redirect_to @component
    else
      render :action => 'new'
    end
  end

  def edit
    @component = Component.find(params[:id])
  end

  def update
    @component = Component.find(params[:id])
    if @component.update_attributes(params[:component])
      flash[:notice] = "Successfully updated component."
      redirect_to component_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @component = Component.find(params[:id])
    @component.destroy
    flash[:notice] = "Successfully destroyed component."
    redirect_to components_url
  end
end
