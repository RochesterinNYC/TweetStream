require 'spec_helper'

describe "searches/new" do
  before(:each) do
    assign(:search, stub_model(Search,
      :keywords => "MyString",
      :latitude => "MyString",
      :longitude => "MyString",
      :radius => "MyString",
      :results_summary => "MyString"
    ).as_new_record)
  end

  it "renders new search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", searches_path, "post" do
      assert_select "input#search_keywords[name=?]", "search[keywords]"
      assert_select "input#search_latitude[name=?]", "search[latitude]"
      assert_select "input#search_longitude[name=?]", "search[longitude]"
      assert_select "input#search_radius[name=?]", "search[radius]"
      assert_select "input#search_results_summary[name=?]", "search[results_summary]"
    end
  end
end
