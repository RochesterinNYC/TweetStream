require "sentiment_classifier"
require "celebrity_checker"
require "frequency_analysis"
require "nerdiness_classifier"

class TweetAnalyzer

	attr_reader :tweets, :term, :raw_text, :top_10_list
	def initialize(term, tweets = SearchEngine.for_term(term))
		@term = term
		@tweets = tweets
		@nerd_classer = NerdinessClassifier.new
	end

	def raw_text
		@raw_text ||= tweets.map { |tweet| tweet.text}.join(" ")
	end

	def awesomeness
		(sentiment_score > 0) ? sentiment_score : 0
	end

	def reprehensibility
		(sentiment_score < 0) ? sentiment_score : 0
	end

	def sentiment_score
		@sentiment_score ||= SentimentClassifier.new.for_text(raw_text)
	end

	def sophistication_score
		@sophistication_score ||= classify_sophistication
	end

	def classify_sophistication
		@nerd_classer.is_sophisticated?(raw_text) ? 6 : 0
	end

	def nerdiness_level
		@nerdiness_level ||= classify_nerdiness
	end

	def classify_nerdiness
		@nerd_classer.is_nerdy?(raw_text) ? 8.5 : 0
	end

	def pop_culture_score
		# @pop_meter ||= PopMeter.for_text(raw_text)
		@pop_meter ||= celebrity_score
	end

	def celebrity_score
		CelebrityChecker.has_celebrity?(raw_text) ? 10 : 0
	end

	def top_10_list
		@top_10_list ||= FrequencyAnalysis.new(raw_text, 4).top_10
	end

	def sum
		sum = 0
		top_10_list.each do |word|
			sum += word[1]
		end
		sum
	end

	def word_labels
		s = sum
		word_labels = []
		top_10_list.each_with_index do |word, index|
			word_labels[index] = {label: word[0], value: 100 * word[1] / s}
		end
		word_labels
	end

end