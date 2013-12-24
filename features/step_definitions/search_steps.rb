When(/^I search for (.*)$/) do |term|
	@approval_coordinates ||= {}
	@approval_coordinates[term] = ApprovalMatrix.for_term(term)
end

Then(/^my twitter approval matrix should be brilliant highbrow$/) do
  pending # express the regexp above with the code you wish you had
end

