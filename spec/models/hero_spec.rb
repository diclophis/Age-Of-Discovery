require 'spec_helper'

describe Aod::Models::Hero do
  def valid_hero
    hero = described_class.new
    hero.username = "foo"
    hero.email = "foo@foo.com"
    hero.password = "qwerty123"
    hero
  end

  it "should have a username, email and password" do
    hero = valid_hero
    hero.save!.should be_truthy

    hero.username.should == "foo"
    hero.fame.should == 0
    hero.converted_gold.length == 1

    #hero.converted_gold << Voucher.new(:worth => 10)
    #hero.converted_gold.sum(:worth).should == 10

    #p hero.converted_gold.methods
    #p hero.converted_gold.sum(:worth)
    #p hero.converted_gold
    #hero.converted_gold.sum(:worth).should == 0
  end

  it "should have a rank" do
    #hero = valid_hero
    #hero.rank = Rank.new
    #hero.save!.should be_nil
  end

  it "should have a unique email" do
    hero = valid_hero
    hero.save!.should be_nil

    hero_again = valid_hero
    hero_again.valid?.should be_false
    hero_again.save.should be_false
  end
end
