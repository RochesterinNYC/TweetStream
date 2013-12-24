class FrequencyAnalysis

  attr_reader :text, :word_frequencies, :words, :top_10, :min_length
	def initialize(text, min_length = 7)
    @min_length = min_length
		@text = text
    clean_and_tokenize
    @word_frequencies = compute_frequency_hash
	end

	def self.for_text(text)
    fa = self.new(text)
		fa.word_frequencies
	end

	def clean_and_tokenize
  	@words = text.to_s.downcase.split(/[\s\!\?\.]+/)
  end

  def compute_frequency_hash
  	word_frequencies = Hash.new(0)
  	words.each do |word|
  		word_frequencies[word] += 1 unless (word.size < min_length || word =~ /http/)
  	end
  	word_frequencies
  end

  def sort
  	sorted_words = word_frequencies.sort_by {|word, count| count}
    sorted_words.reverse
  end

  def top_10
  	@top_10 ||= sort.first(10)
  end

  def top_10_words
    top_10.map {|word, count| word}
  end
end