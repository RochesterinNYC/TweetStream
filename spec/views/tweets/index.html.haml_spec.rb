require 'spec_helper'

describe "tweets/index" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
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
      ),
      stub_model(Tweet,
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
      )
    ])
  end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Id Str".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "User Id Str".to_s, :count => 2
    assert_select "tr>td", :text => "User Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "User Location".to_s, :count => 2
    assert_select "tr>td", :text => "User Description".to_s, :count => 2
    assert_select "tr>td", :text => "User Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "User Friends Count".to_s, :count => 2
    assert_select "tr>td", :text => "User Profile Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Geo".to_s, :count => 2
    assert_select "tr>td", :text => "Coordinates".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
  end
end
