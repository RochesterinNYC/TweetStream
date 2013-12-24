require 'spec_helper'

feature 'View the homepage' do
  scenario 'A new visitor wants to learn about the site' do
    visit root_path
    expect(page).to have_selector("#welcome")
  end
end
