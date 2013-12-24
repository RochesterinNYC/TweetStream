require_relative "../../lib/celebrity_checker"

describe CelebrityChecker do

	it "returns true when text contains a celebrity mention" do
		text = "this is some text with zeta-jones in it"
		CelebrityChecker.has_celebrity?(text).should be true
	end

	it "returns false when text does not contain a celebrity mention" do
		text = "no celebrities here!"
		CelebrityChecker.has_celebrity?(text).should be false
	end
end