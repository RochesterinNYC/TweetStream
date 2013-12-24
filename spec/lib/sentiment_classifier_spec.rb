require_relative "../../lib/sentiment_classifier"

describe SentimentClassifier do

	it "computes the sentiment score for a given term" do
		@sentiment = SentimentClassifier.new
		expect(@sentiment.for_term("love")).to be > 0.0
	end

	it "returns 0.925 for the term love" do
		@sentiment = SentimentClassifier.new
		expect(@sentiment.for_term("love")).to be 0.925
	end

	it "returns a high sentiment for tweets about love" do
		@sentiment = SentimentClassifier.new(0.4)
		expect(@sentiment.for_text("I love Ruby")).to be > 0.5
	end

end