require 'spec_helper'

describe "tweets/edit" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :id_str => "MyString",
      :text => "MyString",
      :source => "MyString",
      :user_id_str => "MyString",
      :user_screen_name => "MyString",
      :user_location => "MyString",
      :user_description => "MyString",
      :user_url => "MyString",
      :user_followers_count => 1,
      :user_friends_count => "MyString",
      :user_profile_image_url => "MyString",
      :geo => "MyString",
      :coordinates => "MyString",
      :place => "MyString"
    ))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tweet_path(@tweet), "post" do
      assert_select "input#tweet_id_str[name=?]", "tweet[id_str]"
      assert_select "input#tweet_text[name=?]", "tweet[text]"
      assert_select "input#tweet_source[name=?]", "tweet[source]"
      assert_select "input#tweet_user_id_str[name=?]", "tweet[user_id_str]"
      assert_select "input#tweet_user_screen_name[name=?]", "tweet[user_screen_name]"
      assert_select "input#tweet_user_location[name=?]", "tweet[user_location]"
      assert_select "input#tweet_user_description[name=?]", "tweet[user_description]"
      assert_select "input#tweet_user_url[name=?]", "tweet[user_url]"
      assert_select "input#tweet_user_followers_count[name=?]", "tweet[user_followers_count]"
      assert_select "input#tweet_user_friends_count[name=?]", "tweet[user_friends_count]"
      assert_select "input#tweet_user_profile_image_url[name=?]", "tweet[user_profile_image_url]"
      assert_select "input#tweet_geo[name=?]", "tweet[geo]"
      assert_select "input#tweet_coordinates[name=?]", "tweet[coordinates]"
      assert_select "input#tweet_place[name=?]", "tweet[place]"
    end
  end
end
