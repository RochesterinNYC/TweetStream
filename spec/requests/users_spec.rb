require 'spec_helper'

describe "Users" do

	before(:each){bypass_authentication}
	after(:each){restore_authentication}

  describe "GET /users" do
    it "accesses a list of users page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_path
      response.status.should be(200)
    end
  end
end
