class SearchEngine

	def self.for_term(term)
		@searcher = TwitterService.new
		@tweets = @searcher.search(term)
	end
end