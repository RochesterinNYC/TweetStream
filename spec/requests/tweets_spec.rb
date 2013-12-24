require 'spec_helper'

describe "Tweets" do

	before(:each){bypass_authentication}
	after(:each){restore_authentication}

  describe "GET /tweets" do
    it "displays a list of tweets" do
      get tweets_path
      response.status.should be(200)
    end
  end
end
