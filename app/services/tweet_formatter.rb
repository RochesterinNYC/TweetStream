class TweetFormatter

	def initialize(status, search_terms)
		@text = status.text
		@terms_array = search_terms.split(' ')
	end

  def highlight_terms
    @terms_array.each do |term|
      unless term == nil or term == ""
        @text.gsub! /#{term}/i, "<mark>#{term}</mark>"
      end
    end
    @text
  end
end