require_relative "../../lib/frequency_analysis"

describe FrequencyAnalysis do

	describe "#for_text(text)" do

		it "counts the number of occurrences of each word in a given text" do
			text = "This is just some text occurrences occurrences here and it has the word just twice."
			word_frequencies = FrequencyAnalysis.for_text(text)
			word_frequencies["occurrences"].should == 2
		end

	end

	describe "analyzes the number of occurrences of each word in a given text" do

		before(:each) do
			@text = <<-CAESAR
					And when you saw his chariot but appear,
					Have you not made an universal shout,
					That Tiber ingratitude trembled underneath her banks,
					To hear the replication of your sounds
					Made in her ingratitude concave shores?
					And do you now put on your best attire?
					And do you now cull out a holiday?
					And do you now strew flowers in his way
					That comes in triumph over Pompey's blood? Be gone!
					Run to your houses, fall upon your knees,
					Pray to the gods to intermit the plague
					That needs must light on this ingratitude.
				CAESAR
			@fa = FrequencyAnalysis.new(@text)
		end

		it "contains the word ingratitude 3 times" do
			@fa.word_frequencies["ingratitude"].should == 3
		end

		it "contains the word replication once" do
			@fa.word_frequencies["replication"].should == 1
		end

		describe "sorts by word frequency" do
			it "returns the 10 most frequent words" do
				top_10 = @fa.top_10_words
				expect(top_10).to include("ingratitude")
			end
		end

		describe "counts only words above the minimum length" do



			it "does not include the word 'you'" do
				min_length = 4
				min_fa = FrequencyAnalysis.new(@text, min_length)
				expect(min_fa.word_frequencies["you"]).to be 0
			end
		end
	end
end