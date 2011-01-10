require File.dirname(__FILE__) + '/../spec_helper'
  
describe "routing to home" do
  
  it "should recognise / to home#index" do
    { :get => "/" }.should route_to(
      :controller => "home",
      :action => "index"
    )
  end
end


