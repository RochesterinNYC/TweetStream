require 'spec_helper'

describe "TweetFormatter" do
	it "highlights search terms" do
		search_terms = "scallywag pompous"
		status = double('status')
		status.should_receive(:text).and_return(
			"I always considered him to be a scallywag. He was pompous and arrogant - frankly, he was a kind of scallywag if you know what I mean."
		)
		formatted_text = TweetFormatter.new(status, search_terms).highlight_terms
		expect(formatted_text).to include("<mark>scallywag</mark>")
		expect(formatted_text).to include("<mark>pompous</mark>")

	end
end