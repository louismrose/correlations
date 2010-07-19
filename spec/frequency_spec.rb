require 'lib/frequency.rb'

describe Frequency do
  context "desired word is not found" do
    it "should return zero" do
      Frequency.new('42 of').run('the').should == 0
    end
  end
  
  context "desired word is in file" do
    it "should return frequency when word is first" do
      Frequency.new('42 of').run('of').should == 42
    end

    it "should return frequency when word is second" do
      Frequency.new("42 of\n13 in").run('in').should == 13
    end
  end
  
  context "when desired word matches start of several words" do
    it "should return frequency of whole word" do
      Frequency.new("42 inside\n13 in").run('in').should == 13
    end
  end
  
  context "when desired word matches end of several words" do
    it "should return frequency of only whole word" do
      Frequency.new("42 inside\n13 side").run('side').should == 13
    end
  end
end
