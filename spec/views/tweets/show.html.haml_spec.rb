require 'spec_helper'

describe "tweets/show" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :id_str => "Id Str",
      :text => "Text",
      :source => "Source",
      :user_id_str => "User Id Str",
      :user_screen_name => "User Screen Name",
      :user_location => "User Location",
      :user_description => "User Description",
      :user_url => "User Url",
      :user_followers_count => 1,
      :user_friends_count => "User Friends Count",
      :user_profile_image_url => "User Profile Image Url",
      :geo => "Geo",
      :coordinates => "Coordinates",
      :place => "Place"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Id Str/)
    rendered.should match(/Text/)
    rendered.should match(/Source/)
    rendered.should match(/User Id Str/)
    rendered.should match(/User Screen Name/)
    rendered.should match(/User Location/)
    rendered.should match(/User Description/)
    rendered.should match(/User Url/)
    rendered.should match(/1/)
    rendered.should match(/User Friends Count/)
    rendered.should match(/User Profile Image Url/)
    rendered.should match(/Geo/)
    rendered.should match(/Coordinates/)
    rendered.should match(/Place/)
  end
end
