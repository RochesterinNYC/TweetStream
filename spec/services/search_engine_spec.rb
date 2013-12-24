require 'spec_helper'

describe SearchEngine do

	describe "search for term" do
		it "returns an array of tweets" do
			VCR.use_cassette 'services/search_engine/aguilera' do
				tweets = SearchEngine.for_term("aguilera")
				tweets.first.full_text.downcase.should include "aguilera"
			end
		end

		it "can be mapped to raw text" do
			VCR.use_cassette 'services/search_engine/aguilera' do
				tweets = SearchEngine.for_term("aguilera")
				raw_text = tweets.map { |tweet| tweet.full_text}.join(" ")
				raw_text.should include "aguilera"
			end
		end
	end
end