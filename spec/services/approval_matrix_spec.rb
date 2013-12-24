require_relative "../../app/services/approval_matrix"
require_relative "../../app/services/tweet_analyzer"

describe ApprovalMatrix do
	# happy path first
	it "returns [10, 10] for brilliant highbrow terms" do
		term = "#Angular"
		# tweets = SearchEngine.for_term(term)
		tweets = "tweet1 tweet2"
		ta = stub('tweet_analyzer')
		approval_matrix = ApprovalMatrix.new(term, ta)
		approval_matrix.stub(:brilliant) 	{ 10 }
		approval_matrix.stub(:despicable) { 0 }
		approval_matrix.stub(:highbrow) 	{ 10 }
		approval_matrix.stub(:lowbrow) 		{ 0 }
		approval_matrix.taste_scale.should == [10.0, 10.0]
	end

	it "returns [-10, 10] for despicable highbrow terms" do
		term = "Cornell sorority"
		# tweets = SearchEngine.for_term(term)
		tweets = stub('tweets')
		ta = stub('tweet_analyzer')
		approval_matrix = ApprovalMatrix.new(term, ta)
		approval_matrix.stub(:brilliant) 	{ 0 }
		approval_matrix.stub(:despicable) { 10 }
		approval_matrix.stub(:highbrow) 	{ 10 }
		approval_matrix.stub(:lowbrow) 		{ 0 }
		approval_matrix.taste_scale.should == [-10.0, 10.0]
	end

	it "returns [-10, -10] for despicable lowbrow terms"
	it "returns [10, -10] for brilliant lowbrow terms"

	it "returns ambiguous results for uninteresting terms" do
		term = "Ft. Lauderdale"
		approval_matrix = ApprovalMatrix.new(term, stub)
		approval_matrix.stub(:brilliant) 	{ 48 }
		approval_matrix.stub(:despicable) { 52 }
		approval_matrix.stub(:highbrow) 	{ 58 }
		approval_matrix.stub(:lowbrow) 		{ 42 }
		approval_matrix.taste_scale.should == [-0.4, 1.6]
	end

	it "returns [0, 10] for uninteresting highbrow terms"
	it "returns [0, -10] for uninteresting lowbrow terms"
	it "returns [-10, 0] for despicable but accessible terms"
	it "returns [10, 0] for brilliant and generally acceptable terms"
	it "does not divide by zero" do
		term = "asdfhjfipuwh"
		approval_matrix = ApprovalMatrix.new(term, stub)
		approval_matrix.stub(:brilliant) 	{ 0 }
		approval_matrix.stub(:despicable) { 0 }
		approval_matrix.stub(:highbrow) 	{ 0 }
		approval_matrix.stub(:lowbrow) 		{ 0 }
		approval_matrix.taste_scale.should == ApprovalMatrix::NoScale
	end

end