require 'spec_helper'

describe "searches/edit" do
  before(:each) do
    @search = assign(:search, stub_model(Search,
      :keywords => "MyString",
      :latitude => "MyString",
      :longitude => "MyString",
      :radius => "MyString",
      :results_summary => "MyString"
    ))
  end

  it "renders the edit search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", search_path(@search), "post" do
      assert_select "input#search_keywords[name=?]", "search[keywords]"
      assert_select "input#search_latitude[name=?]", "search[latitude]"
      assert_select "input#search_longitude[name=?]", "search[longitude]"
      assert_select "input#search_radius[name=?]", "search[radius]"
      assert_select "input#search_results_summary[name=?]", "search[results_summary]"
    end
  end
end
