class NerdinessClassifier
	# largely taken from https://github.com/7compass/sentimental

	@@nerdiness_dict = []
  @@sophistication_dict = []

  def initialize()
    NerdinessClassifier.load_defaults
  end

  # def nerdiness_for_text(text)
  # 	nerd_words = 0
  # 	nerd_score = 0.0
  # 	words = clean_and_tokenize(text)
  # 	words.each do |word|
  #     word_score = @@sentiment_hash[word]
  # 		if word_score && word_score.abs > @threshold
  #       puts "WORD #{word} score - #{word_score}"
  # 			sentimental_words += 1
  # 			sentimental_score += @@sentiment_hash[word]
  # 		end
  # 	end
  # 	average_sentiment = sentimental_score / sentimental_words
  # end

  # def sophistication_for_text(text)
  #   sophisticated_words = 0
  #   sophisticated_score = 0.0
  #   words = clean_and_tokenize(text)
  #   words.each do |word|
  #     word_score = @@sentiment_hash[word]
  #     if word_score && word_score.abs > @threshold
  #       puts "WORD #{word} score - #{word_score}"
  #       sentimental_words += 1
  #       sentimental_score += @@sentiment_hash[word]
  #     end
  #   end
  #   average_sentiment = sentimental_score / sentimental_words
  # end

  def clean_and_tokenize(text)
  	text.to_s.downcase.split(/[\s\!\?\.]+/)
  end

  def is_nerdy?(text)
  	@@nerdiness_dict.each do |phrase|
      if text.include? phrase
        return true
      end
    end
    return false
  end

  def is_sophisticated?(text)
    @@sophistication_dict.each do |phrase|
      if text.include? phrase
        return true
      end
    end
    return false
  end

  # Loads the default sentiment files
  def self.load_defaults
    @math_dict = load_dict_file(@@nerdiness_dict, File.dirname(__FILE__) + '/assets/mathterms.txt')
    @github_dict = load_dict_file(@@nerdiness_dict, File.dirname(__FILE__) + '/assets/github.txt')

    @gre_dict = load_dict_file(@@sophistication_dict, File.dirname(__FILE__) + '/assets/gre_words.txt')
    @philo_dict = load_dict_file(@@sophistication_dict, File.dirname(__FILE__) + '/assets/philosophical_lexicon.txt')
  end

  def self.load_dict_file(array, filename)
    # load the word file
    file = File.new(filename)
    while (line = file.gets)
      parsedline = line.chomp
      array.push(line)
    end
    file.close
  end
end