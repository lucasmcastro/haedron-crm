require File.dirname(__FILE__) + '/../spec_helper'

describe Account do

  context "with invalid attribute" do
    before :each do
      @account = Account.new(:display_name => '', :legal_name => '', :legal_number => '')
      @account.valid?
    end

    it "should have error on display_name" do
      @account.errors[:display_name].should_not be_nil
    end
    
    it "should have only one size error on display_name.size <= 3" do
      @account.display_name = 'a' * 3
      @account.valid?
      @account.errors[:display_name].count.should == 1
    end

    it "should have only one size error on display_name.size >= 46" do
      @display_name = 'a' * 46
      @account.valid?
      @account.errors[:display_name].count.should == 1
    end

    it "should have only one size error on legal_name.size <= 3" do
      @account.legal_name = 'a' * 3
      @account.valid?
      @account.errors[:legal_name].count.should == 1
    end

    it "should have only one size error on legal_name.size >= 61" do
      @account.legal_name = 'a' * 61
      @account.valid?
      @account.errors[:legal_name].count.should == 1
    end

    it "should have error on legal_number" do
      @account.legal_number = '1'
      @account.valid?
      @account.errors[:legal_number].count.should == 1
    end
  end

  context "with valid attribute" do
    before :each do
      @account = Account.new(:display_name => "example", :legal_name => "example", :legal_number => "22833437000180")
    end

    it "should humanize legal_number" do
      @account.legal_number.to_s.should == '22.833.437/0001-80'
    end
  end
end
