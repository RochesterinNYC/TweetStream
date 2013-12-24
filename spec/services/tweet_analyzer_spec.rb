# require "vcr"
# require "twitter"
# require_relative "../../app/services/tweet_analyzer"
require_relative "../../lib/sentiment_classifier"
require_relative "../../lib/frequency_analysis"
require_relative "../../lib/celebrity_checker"
# require_relative "../../app/services/search_engine"
# require_relative "../../app/services/twitter_service"
require "spec_helper"

describe TweetAnalyzer do
	before(:each) do
		VCR.use_cassette 'services/tweet_analyzer/mtv_stars' do
			@term = "#MTVStars"
			@tweets = SearchEngine.for_term(@term)
		end
	end

	it "measures sentiment" do
		text = <<-POSITIVE
			I can't even begin to describe how great this is.  Thank you!
			Thanks to the developers who made this.  Pure awesome sauce.
			I just want to snuggle in this program and fall asleep.
			It's cuter than a bug in a rug.
			Technical excellence, achieved.
			POSITIVE
		sentiment = SentimentClassifier.new.for_text(text)
		sentiment.should be > 0.5
	end

	describe "#awesomeness" do
		it "measures awesomeness"
		it "returns 0 when sentiment is negative"
		it "returns the sentiment value when sentiment is positive"
	end

	describe "#reprehensibility" do
		it "measures reprehensibility"
		it "returns 0 when sentiment is positive"
		it "returns the sentiment score when sentiment is negative"
	end

	it "measures the presence and density of pop culture references" do
		ta = TweetAnalyzer.new(@term, @tweets)
		expect(ta.pop_culture_score).to be 10
	end

	it "measures sophistication"
	it "measures perceived nerdiness"
	it "computes the top 10 words by frequency" do
		ta = TweetAnalyzer.new(@term, @tweets)
		expect(ta.top_10_list.size).to be 10
		expect(ta.top_10_list[0][1]).to be >= ta.top_10_list[1][1]
		expect(ta.top_10_list[1][1]).to be >= ta.top_10_list[2][1]
		expect(ta.top_10_list[0][1]).to be >= ta.top_10_list[9][1]
	end
end