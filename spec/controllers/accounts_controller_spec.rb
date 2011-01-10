require File.dirname(__FILE__) + '/../spec_helper'

describe AccountsController, "creating a new account" do
  login_admin
  render_views
  fixtures :accounts
  
  it "should redirect to index with a notice on successful save" do
    Account.any_instance.stubs(:valid?).returns(true)
    post 'create'
    assigns[:account].should_not be_new_record
    response.should redirect_to(account_path assigns[:account])    
  end
    
  it "should pass params to menu item" do
    post 'create', :account => { :display_name => 'Example' }
    assigns[:account].display_name.should == 'Example'
  end
  
  
    
end