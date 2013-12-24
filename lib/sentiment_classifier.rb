class SentimentClassifier
	# largely taken from https://github.com/7compass/sentimental

	@@sentiment_hash = Hash.new(0.0)
  @@threshold = 0.6

  def initialize(threshold = nil)
    SentimentClassifier.load_defaults
    @threshold = threshold || @@threshold
  end

  def for_text(text)
  	sentimental_words = 0
  	sentimental_score = 0.0
  	words = clean_and_tokenize(text)
  	words.each do |word|
      word_score = @@sentiment_hash[word]
  		if word_score && word_score.abs > @threshold
        puts "WORD #{word} score - #{word_score}"
  			sentimental_words += 1
  			sentimental_score += @@sentiment_hash[word]
  		end
  	end
  	average_sentiment = sentimental_score * 100 / sentimental_words
  end

  def clean_and_tokenize(text)
  	text.to_s.downcase.split(/[\s\!\?\.]+/)
  end

  def for_term(term)
  	@@sentiment_hash[term] || 0.0
  end

  # Loads the default sentiment files
  def self.load_defaults
    load_sentiment_file(File.dirname(__FILE__) + '/assets/sentiwords.txt')
    load_sentiment_file(File.dirname(__FILE__) + '/assets/sentislang.txt')
  end

  def self.load_sentiment_file(filename)
    # load the word file
    file = File.new(filename)
    while (line = file.gets)
      parsedline = line.chomp.split(/\s/)
      sentiscore = parsedline[0]
      text = parsedline[1]
      @@sentiment_hash[text] = sentiscore.to_f
    end
    file.close
  end

  def self.threshold=(threshold)
    @@threshold = threshold
  end
end