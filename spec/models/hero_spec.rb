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
    expect(hero.save!).to be_truthy


    expect(hero.username).to eq("foo")

    expect(hero.fame).to eq(0)

    expect(hero.converted_gold.length).to eq(1)

    hero.converted_gold << Aod::Models::Voucher.new(:worth => 10)
    expect(hero.converted_gold.sum(&:worth)).to eq(10)

    #p hero.converted_gold.methods
    #p hero.converted_gold.sum(:worth)
    #p hero.converted_gold
    #hero.converted_gold.sum(:worth).should == 0
  end

  it "should have a rank" do
    hero = valid_hero
    hero.rank = Aod::Models::Rank.new
    expect(hero.save!).to be_truthy
  end

  it "should have a unique email" do
    hero = valid_hero
    expect(hero.save!).to be_truthy

    hero_again = valid_hero
    expect(hero_again.valid?).to be_falsey
    expect(hero_again.save).to be_falsey
  end
end
