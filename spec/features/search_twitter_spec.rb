require 'spec_helper'


feature 'Search Twitter for a term' do

  before(:each){bypass_authentication}
  after(:each){restore_authentication}

  scenario 'search by hashtag' do
    VCR.use_cassette 'model/search' do
      visit new_search_path
      fill_in 'Keywords', with: 'Rails'
      click_button 'Search'
      expect(page).to have_css 'li.tweet'
    end
  end
end
