class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_return_to
  before_filter :get_selected_site_tab

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
  
  def set_return_to
    unless controller_name.downcase == 'sessions' or is_non_html_request?
      session[:return_to] = request.request_uri
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
    if current_user && session[:return_to]
      return session[:return_to]
    end
    super(resource) 
  end
end
