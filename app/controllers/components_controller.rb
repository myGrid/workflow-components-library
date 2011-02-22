class ComponentsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]
  
  load_and_authorize_resource
  
  def index
    @components = @components.paginate :page => @page, :per_page => @per_page, :order => "updated_at DESC"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @components }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @component }
    end
  end

  def new
  end

  def create
    @component.submitter = current_user
    if @component.save
      flash[:notice] = "Successfully created component."
      redirect_to @component
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @component.update_attributes(params[:component])
      flash[:notice] = "Successfully updated component."
      redirect_to component_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @component.destroy
    flash[:notice] = "Successfully destroyed component."
    redirect_to components_url
  end
end
