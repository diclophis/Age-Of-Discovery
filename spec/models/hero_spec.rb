#require_relative '../spec_helper'
require 'spec_helper'

describe Hero do
  it "should have a username, email and password" do
    hero = Hero.new
    hero.username = "foo"
    hero.email = "foo@foo.com"
    hero.password = "qwerty123"
    hero.valid?.should be_true
    hero.username.should == "foo"
  end
end
