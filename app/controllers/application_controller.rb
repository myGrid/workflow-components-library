class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_selected_site_tab

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
    redirect_to root_url
  end
  
  private
  
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
end
