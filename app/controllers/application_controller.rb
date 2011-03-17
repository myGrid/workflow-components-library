class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_previous_url
  before_filter :get_selected_site_tab
  before_filter :set_page
  before_filter :set_per_page
  before_filter :set_limit
  before_filter :set_search_query

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
    redirect_to(session[:return_to] || root_url)
  end
  
  protected
  
  def is_api_request?
    return [ :xml, :atom, :json ].include?(self.request.format.to_sym)
  end
  
  def is_non_html_request?
    return !self.request.format.html?
  end
  
  def set_previous_url
    unless controller_name.downcase == 'sessions' or 
      (controller_name.downcase == 'users' and [ 'sign_in', 'sign_out' ].include?(action_name.downcase)) or
      is_non_html_request?
      session[:previous_url] = request.fullpath
    end
  end
  
  def get_selected_site_tab
    c = controller_name.downcase.to_sym
    a = action_name.downcase.to_sym
    
    @selected_site_tab =
    if c == :components and a == :new 
      :new_component
    else
      c
    end
  end
  
  # For Devise
  def stored_location_for(resource)
    if current_user && session[:previous_url]
      return session[:previous_url]
    end
    super(resource) 
  end
  
  def set_page
    if self.request.format == :atom
      @page = 1
    else
      page = (params[:page] || 1).to_i
      if page < 1
        error("An invalid page number has been specified in the URL")
        return false
      else
        @page = page
      end
    end
    
  end
  
  def set_per_page
    if self.request.format == :atom
      @per_page = 20
    else
      per_page = (params[:per_page] || Settings.default_page_size).try(:to_i)
      if per_page < 1
        error("An invalid 'per page' number has been specified in the URL")
        return false
      elsif per_page > Settings.max_page_size
        @per_page = Settings.max_page_size
      else
        @per_page = per_page
      end
    end
    
  end
  
  def set_limit
    limit = params[:limit].try(:to_i)
    if limit and limit < 1
      error("A wrong limit has been specified in the URL")
      return false
    else
      @limit = limit
    end
  end
  
  def set_search_query
    @search_query = params[:q]
  end
  
  # Generic method to raise / proceed from errors. 
  #
  # For HTML format: renders homepage (or redirects to previous URL), with an error message and appropriate HTTP status code.
  # For API formats: renders an error collection and appropriate HTTP status code.
  #
  # Options:
  # - :back_first - specifies whether to try to redirect back first (default: false).
  # - :forbidden - specifies whether this was a forbidden request or not (default: false).
  # - :status - specifies which HTTP Status code to use (default 403 or 400, depending on whether :forbidden is true or not [respectively]).
  #
  # Note: you should return (and in some cases return false) after using this method so that no other respond_to clash.
  def error(messages, *args)
    options = args.extract_options!
    # defaults:
    options.reverse_merge!(:back_first => false,
                           :forbidden => false,
                           :status => (options[:forbidden] ? 403 : 400))
    
    messages = [ messages ].flatten
    
    flash[:error] = messages.to_sentence
    
    if is_api_request?
      messages << "{{Link to API docs goes here}}"
    end
    
    respond_to do |format|
      
      if options[:back_first] && !session[:previous_url].blank?
        format.html { redirect_to(session[:previous_url]) }
      else
        format.html { render "home/index", :status => options[:status] }
      end
      
      if options[:forbidden]
        format.xml  { head :forbidden }
        format.json { head :forbidden }
        format.atom { head :forbidden }
      else
        @errors = messages
        
        format.xml  { render "api/errors", :status => options[:status] }
        format.json { render :json => { "errors" => messages }.to_json, :status => options[:status] }
        format.atom { render :atom => "", :status => options[:status] }
      end
    end
  end

  # LEGACY METHOD
  # Generic method to raise / proceed from errors.
  #
  # For HTML format: redirects back to the previous page, OR the homepage.
  # For API formats: renders an error collection and appropriate HTTP status code.
  #
  # Note: you should return (and in some cases return false) after using this method so that no other respond_to clash.
  def error_to_back_or_home(msg, forbidden=false, status_code=(forbidden ? 403 : 400))
    error([ msg ], :back_first => true, :forbidden => forbidden, :status => status_code)
  end
end
