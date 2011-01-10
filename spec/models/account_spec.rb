require File.dirname(__FILE__) + '/../spec_helper'

module AccountSpecHelper
  def valid_account_attributes
    {
      :display_name => 'Example',
      :legal_name => 'Example INC',
      :legal_number => '22833437000180'
    }
  end
end

describe Account do
  include AccountSpecHelper
  
  context "with invalid attribute" do
    before :each do
      @account = Account.new(valid_account_attributes)
      @account.valid?
    end

    it "should have error on display_name if display_name is blank" do
      @account.attributes = valid_account_attributes.replace(:display_name => '')
      @account.should have(1).error_on :display_name
    end
    
    it "should have error on display_name if display_name.size <= 3" do
      @account.attributes = valid_account_attributes.replace(:display_name => 'a' * 3)
      @account.should have(1).error_on :display_name
    end

    it "should have error on display_name if display_name.size >= 46" do
      @account.attributes = valid_account_attributes.replace(:display_name => 'a' * 46)
      @account.should have(1).error_on :display_name
    end

    it "should have error on legal_name if legal_name.size <= 3" do
      @account.attributes = valid_account_attributes.replace(:legal_name => 'a' * 3)
      @account.should have(1).error_on :legal_name
    end

    it "should have error on legal_name if legal_name.size >= 61" do
      @account.attributes = valid_account_attributes.replace(:legal_name => 'a' * 61)
      @account.should have(1).error_on :legal_name
    end

    it "should have error on legal_number" do
      @account.attributes = valid_account_attributes.replace(:legal_number => '1')
      @account.should have(1).error_on :legal_number
    end

    it "should not display blank error when size error triggered on display_name" do
      @account.attributes = valid_account_attributes.replace(:display_name => 'a' * 46)
      @account.should have(1).error_on :display_name
    end
  end

  context "with valid attribute" do
    before :each do
      @account = Account.new(valid_account_attributes)
    end

    it "should humanize legal_number" do
      @account.legal_number.to_s.should eql('22.833.437/0001-80')
    end
  end
end