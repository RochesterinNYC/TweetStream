class CelebrityChecker
	@@celebrity_hash = Hash.new(false)

	CELEBRITIES = [ "Naomi Watts", "Angelina Jolie", "Megan Fox", "Franco Nero",
		"Peter Billingsley", "Jason London", "Ron Jeremy", "George Pal",
		"Patricia Arquette", "Selena Gomez", "Vincent D'Onofrio", "Matt Damon",
		"Jennifer Lopez", "Shia LaBeouf", "Marisa Tomei", "Seth Rogen",
		"Robert Redford", "Jennifer Lawrence", "Tom Hanks", "Justin Bieber",
		"James Caviezel", "Bill Murray", "Charlie Sheen", "Catherine Zeta-Jones",
		"Kelly Lynch", "Kristen Stewart", "Ben Affleck", "Jeremy Renner",
		"Brad Pitt", "Ashley Judd", "Jason Schwartzman", "Robert De Niro",
		"Jude Law", "Natalya Rudakova", "Jason Bateman", "Jennifer Aniston",
		"Johnny Depp", "Gabriel Macht", "John Malkovich", "Channing Tatum",
		"Amanda Seyfried", "Mary-Louise Parker", "Mark Harmon", "Bradley Cooper",
		"Christina Aguilera", "Jason Statham", "Sarah Jessica Parker",
		"Jessica Alba", "Stacey Dash", "Paige Simpson", "Will Ferrell",
		"Gemma Arterton", "Sylvester Stallone", "Miley Cyrus", "Vince Vaughn",
		"Leonardo DiCaprio", "Golshifteh Farahani", "Tommy Lee Jones",
		"Angelu DeLeon", "Philip Seymour Hoffman", "George Clooney",
		"Justin Timberlake", "Kathleen Turner", "Martin Sheen", "Nicole Kidman",
		"Skylar Astin", "Bruce Willis", "Scarlett Johansson", "Mickey Rourke",
		"Roman Coppola", "Denzel Washington", "Danny Trejo", "Adam Sandler",
		"Chris Hemsworth", "Matthew McConaughey", "Famke Janssen", "Lucas Black",
		"Kim Kardashian", "Tom Cruise", "Eddie Murphy", "Ron Howard",
		"Jennifer Garner", "Robert Pattinson", "Christopher Waltz",
		"Beyonce Knowles", "Lindsay Lohan", "Jeananne Goossen", "Emily Mortimer",
		"Jane Fonda", "Meryl Streep", "Tom Hardy", "Wesley Snipes", "Sean Penn",
		"Paul Rudd", "Zooey Deschanel", "Jessica Chastain", "Emma Thompson",
		"Viola Davis", "Maksim Vitorgan", "Sarah Shahi"
	]

	CELEBRITY_LAST_NAMES = [ "Watts", "Jolie", "Fox", "Nero",
		"Billingsley", "London", "Jeremy", "Pal",
		"Arquette", "Gomez", "D'Onofrio", "Damon",
		"Lopez", "LaBeouf", "Tomei", "Rogen",
		"Redford", "Lawrence", "Hanks", "Bieber",
		"Caviezel", "Murray", "Sheen", "Zeta-Jones",
		"Lynch", "Stewart", "Affleck", "Renner",
		"Pitt", "Judd", "Schwartzman", "De Niro",
		"Law", "Rudakova", "Bateman", "Aniston",
		"Depp", "Macht", "Malkovich", "Tatum",
		"Seyfried", "Louise-Parker", "Harmon", "Cooper",
		"Aguilera", "Statham", "Parker",
		"Alba", "Dash", "Simpson", "Ferrell",
		"Arterton", "Stallone", "Cyrus", "Vaughn",
		"DiCaprio", "Farahani", "Lee Jones",
		"DeLeon", "Hoffman", "Clooney",
		"Timberlake", "Turner", "Sheen", "Kidman",
		"Astin", "Willis", "Johansson", "Rourke",
		"Coppola", "Washington", "Trejo", "Sandler",
		"Hemsworth", "McConaughey", "Janssen", "Black",
		"Kardashian", "Cruise", "Murphy", "Howard",
		"Garner", "Pattinson", "Waltz",
		"Knowles", "Lohan", "Goossen", "Mortimer",
		"Fonda", "Streep", "Hardy", "Snipes", "Penn",
		"Rudd", "Deschanel", "Chastain", "Thompson",
		"Davis", "Vitorgan", "Sarah Shahi"
	]

	def initialize(threshold = nil)
    CelebrityChecker.load_defaults
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
  	average_sentiment = sentimental_score / sentimental_words
  end

  def clean_and_tokenize(text)
  	text.to_s.downcase.split(/[\s\!\?\.]+/)
  end

  def for_term(term)
  	@@celebrity_hash[term]
  end

  # Loads the default sentiment files
  def self.load_defaults
    load_sentiment_file(File.dirname(__FILE__) + '/assets/celebrities2.txt')
  end

  def self.load_sentiment_file(filename)
    # load the word file
    file = File.new(filename)
    while (line = file.gets)
      parsedline = line
      celeb = parsedline[0]
      @@celebrity_hash[celeb] = true
    end
    file.close
  end
	def self.has_celebrity?(raw_text)
		CELEBRITIES.each do |celebrity|
			if raw_text =~ /#{celebrity.downcase}/
				return true
			end
		end
		CELEBRITY_LAST_NAMES.each do |celebrity|
			if raw_text =~ /#{celebrity.downcase}/
				return true
			end
		end
		return false
	end

end