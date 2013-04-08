require 'spec_helper'

describe "the signup process" do #, :type => :feature, :js => true do
  before :each do
    # User.make(:email => 'user@example.com', :password => 'caplin')
  end

  it "signs me in" do
    visit '/hero/sign_in'
    page.save_screenshot('/tmp/file.png', :full => true)
    within("#new_hero") do
      fill_in 'hero_email', :with => 'user@example.com'
      fill_in 'hero_password', :with => 'password'
    end
    click_button 'Sign in'
    page.should have_content 'Success'
  end
end
