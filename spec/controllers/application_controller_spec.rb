require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe ApplicationController do

  before { @user = User.new }

  describe "#current_user" do
    subject { controller.current_user }
    it "references a previously loaded user" do
      controller.instance_variable_set(:@current_user, @user)
      should == @user
    end
    it "loads the user from the cookie" do
      controller.should_receive(:load_user_from_cookie).and_return(@user)
      should == @user
    end
    it "creates a new user if one is not found" do
      controller.stub!(:load_user_from_cookie).and_return(nil)
      controller.should_receive(:create_user).and_return(@user)
      should == @user
    end
  end

  describe "#load_user_from_cookie" do
    subject { controller.send(:load_user_from_cookie) }
    it "loads a user with the id if there is one" do
      cookies[:claim_code] = 'a claim code'
      User.should_receive(:find_by_claim_code).with('a claim code').and_return(@user)
      should == @user
    end
    it "returns nil without a claim code" do
      User.should_receive(:find_by_claim_code).never
      should be_nil
    end
  end

  describe "#create_user" do
    before { controller.stub!(:cookies).and_return(@cookies = {}) }
    subject { controller.send(:create_user) }
    it "returns a new saved user" do
      User.should_receive(:create!).and_return(@user)
      should == @user
    end
    it "stores a claim code cookie" do
      User.stub!(:create!).and_return(@user)
      @user.claim_code = 'a new claim code'
      should be_a_kind_of(User)
      @cookies[:claim_code].should == @user.claim_code
    end
  end
end
