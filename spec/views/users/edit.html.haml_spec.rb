require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/claim.html" do
  subject do
    render 'users/claim.html'
    response
  end

end
