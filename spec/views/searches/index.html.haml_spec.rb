require 'spec_helper'

describe "searches/index" do
  before(:each) do
    assign(:searches, [
      stub_model(Search,
        :keywords => "Keywords",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :radius => "Radius",
        :results_summary => "Results Summary"
      ),
      stub_model(Search,
        :keywords => "Keywords",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :radius => "Radius",
        :results_summary => "Results Summary"
      )
    ])
  end

  it "renders a list of searches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
    assert_select "tr>td", :text => "Radius".to_s, :count => 2
    assert_select "tr>td", :text => "Results Summary".to_s, :count => 2
  end
end
