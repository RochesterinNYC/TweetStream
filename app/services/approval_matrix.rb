class ApprovalMatrix
	# I put the question to Emily Nussbaum, the New Yorker TV critic who,
	# as an editor at New York, helped create the Approval Matrix.
	# Nussbaum had this to say in response: "I consider it a multi-faceted,
	# prismatic, 5-Dimensional environment with a hidden wormhole, impossible
	# to fully portray on paper, so 'matrix' seemed to work as shorthand."

	NoScale = Class.new

	MULTIPLIER = 10

	attr_reader :term, :tweet_analyzer
	def initialize(term, tweet_analyzer = TweetAnalyzer.new(term))
		@term = term
		@tweet_analyzer = tweet_analyzer
	end

	def self.for_term(term)
		self.new(term).taste_scale
	end

	def taste_scale
		taste_coordinates = [despicable_or_brilliant, lowbrow_or_highbrow]
		(despicable_or_brilliant.nan? || lowbrow_or_highbrow.nan?) ? NoScale : taste_coordinates
	end

	def despicable_or_brilliant
		score = MULTIPLIER * (brilliant - despicable) / (brilliant + despicable).to_f
		if score >= 10
			score = 7.8
		elsif score <= -10
			score = -6.4
		end
		score
	end

	def lowbrow_or_highbrow
		score = MULTIPLIER * (highbrow - lowbrow) / (highbrow + lowbrow).to_f
		if score >= 10
			score = 9.3
		elsif score <= -10
			score = -8.7
		end
		score
	end

	private

	def brilliant
		tweet_analyzer.awesomeness
	end

	def despicable
		tweet_analyzer.reprehensibility
	end

	def lowbrow
		tweet_analyzer.pop_culture_score
	end

	def highbrow
		tweet_analyzer.sophistication_score +
		tweet_analyzer.nerdiness_level
	end
end