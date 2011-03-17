class ComponentsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]
  
  load_and_authorize_resource :except => :index
  
  before_filter :find_components, :only => :index
  
  def index
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
  
  private
  
  def find_components
    Wcl::Util.say "\n\n*** search_query = #{@search_query}\n\n"
    if @search_query
      search_query = @search_query
      search_response = Component.search do
        keywords search_query
        paginate :page => @page, :per_page => @per_page
      end
      @components = search_response.results
    else
      @components = @components.paginate :page => @page, :per_page => @per_page, :order => "updated_at DESC"
    end
  end
end
