require 'spec_helper'

describe "Searches" do

	before(:each){bypass_authentication}
	after(:each){restore_authentication}

  describe "GET /searches" do
    it "displays a list of searches page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get searches_path
      response.status.should be(200)
    end
  end
end
