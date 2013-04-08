require 'spec_helper'

describe Hero do
  it "should have a username, email and password" do
    hero = Hero.new
    hero.username = "foo"
    hero.email = "foo@foo.com"
    hero.password = "qwerty123"

    hero.valid?.should be_true
    hero.save.should be_true

    hero.username.should == "foo"
    hero.fame.should == 0

    hero.converted_gold.length == 1
    #p hero.converted_gold
    #hero.converted_gold.sum(:worth).should == 0

    hero.converted_gold << Voucher.new(:worth => 10)

    #p hero.converted_gold.methods
    #p hero.converted_gold.sum(:worth)
    
    hero.converted_gold.sum(:worth).should == 10

  end
end
