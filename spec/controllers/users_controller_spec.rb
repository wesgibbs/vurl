require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do

  before do
    @user = User.new
  end

  describe "on GET to claim" do
    describe "with a valid claim code" do
      before do
        User.stub!(:find_by_claim_code).and_return(@user)
      end
      it "renders the edit template" do
        get :claim, :claim_code => 'some long claim code'
        should render_template('edit')
      end
    end

    describe "with an invalid claim code" do
      before do
        User.stub!(:find_by_claim_code).and_return(nil)
        get :claim, :claim_code => 'some bs code'
      end
      it "flashes an error message" do
        flash[:error].should_not be_nil
      end
      it "redirects to the home page" do
        should redirect_to(root_path)
      end
    end
  end

  describe "on GET to edit" do
    describe "when the user is found" do
      it "renders the edit template" do
        User.stub!(:find).and_return(@user)
        get :claim, :claim_code => 'some long claim code'
        should render_template('edit')
      end
    end

    describe "when the user cannot be found" do
      before do
        User.stub!(:find).and_return(nil)
        get :claim, :claim_code => 'some bs code'
      end
      it "flashes an error message" do
        flash[:error].should_not be_nil
      end
      it "redirects to the home page" do
        should redirect_to(root_path)
      end
    end
  end
end
