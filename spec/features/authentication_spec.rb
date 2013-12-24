require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the application', type: :feature do
  before(:each) do
    visit root_path
  end

  context 'when logged out' do
    it "doesn't have a logout link" do
      expect(page).not_to have_link('Logout', href: logout_path)
    end
  end

  describe '#authenticated?' do
    it "if email and password match" do
      create(:user, email: "email@example.com", password: "secret", password_confirmation: "secret")
      AuthenticationService.new(email: "email@example.com", password: "secret",
        password_confirmation: "secret").should be_authenticated
      AuthenticationService.new(email: "email@example.com", password: "a",
        password_confirmation: "a").should_not be_authenticated
      AuthenticationService.new(email: "a", password: "secret",
        password_confirmation: "secret").should_not be_authenticated
    end

    it "if omniauth" do
      create(:user, email: "email@example.com", password: "secret", password_confirmation: "secret")
      AuthenticationService.new(nil, {provider: "foo", uid: "123", info: {nickname: "newfoo"}}).should be_authenticated
    end
  end

  describe '#user' do
    it "matches email" do
      user = create(:user, email: "email@example.com", password: "secret", password_confirmation: "secret")
      AuthenticationService.new(email: "email@example.com", password: "secret", password_confirmation: "secret").user.should eq(user)
    end

    it "matches omniauth details" do
      user = create(:user, provider: "foo", uid: "123",
                    name: "newname", oauth_token: "token2",
                    oauth_secret: "secret2")
      omniauth = {provider: "foo", "uid" => "123", "info" => {"name" => "newname"},
        "credentials" => { "token" => "token2", "secret" => "secret2" }
      }
      AuthenticationService.new(nil, omniauth).user.should eq(user)
      AuthenticationService.new(nil, omniauth).user.name.should eq("newname")
    end
  end
end
