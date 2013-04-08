require 'spec_helper'

describe "the signup process" do
  before :each do
    Hero.create(:email => 'user@example.com', :password => 'password')
  end

  it "signs me in" do
    visit new_hero_session_path
    #TODO: save screenshot artifacts somewhere
    page.save_screenshot('/tmp/file.png', :full => true)
    within("#new_hero") do
      fill_in 'hero_email', :with => 'user@example.com'
      fill_in 'hero_password', :with => 'password'
    end
    click_button 'Sign in'
    page.should have_content 'Success'
  end
end