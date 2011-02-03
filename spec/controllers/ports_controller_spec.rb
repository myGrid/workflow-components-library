require File.dirname(__FILE__) + '/../spec_helper'

describe PortsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Port.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Port.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Port.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(port_url(assigns[:port]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Port.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Port.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Port.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Port.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Port.first
    response.should redirect_to(port_url(assigns[:port]))
  end

  it "destroy action should destroy model and redirect to index action" do
    port = Port.first
    delete :destroy, :id => port
    response.should redirect_to(ports_url)
    Port.exists?(port.id).should be_false
  end
end
