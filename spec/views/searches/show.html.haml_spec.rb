require 'spec_helper'

describe "searches/show" do
  before(:each) do
    @search = assign(:search, stub_model(Search,
      :keywords => "Keywords",
      :latitude => "Latitude",
      :longitude => "Longitude",
      :radius => "Radius",
      :results_summary => "Results Summary"
    ))
    tweet = double(:tweet,:text => "This is a tweet")
    @tweets = [tweet]
  end

  # it "renders attributes in" do
  #   render
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/Keywords/)
  #   rendered.should match(/Latitude/)
  #   rendered.should match(/Longitude/)
  #   rendered.should match(/Radius/)
  #   rendered.should match(/Results Summary/)
  # end
end
