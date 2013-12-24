require 'spec_helper'

describe User do

	let(:user) { User.create(
		name: "Some name",
		email: "email@example.com",
		password: "password",
		password_confirmation: "password"
	)}

	describe "basic user" do
		it "is valid with password" do
			user.should be_valid
		end

		it "is invalid without a password" do
			user_without_password = User.create(
				name: "Heidi Shira",
				email: "heidi@example.com"
			)
			user_without_password.should_not be_valid
		end

		it "is unconfirmed without an email" do
			user.email = nil
			user.should_not be_confirmed
		end

		it "is invalid without a name" do
			user.name = nil
			user.should_not be_valid
		end
	end
end
