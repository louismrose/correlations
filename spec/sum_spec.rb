require 'lib/sum.rb'

describe Sum do
  
  def sum table
    Sum.new(table).run  
  end
  
  context "empty string" do
    it "should return zero for empty string" do
      sum('').should == 0
    end
  end
  
  context "single line" do
    it "should return number for numeric string" do
      sum('456').should == 456
    end
    
    it "should return number for string beginning with numerics" do
      sum('456 fruit flies').should == 456
    end
    
    it "should return zero for string containing numerics not at start" do
      sum('zero 1 zero').should == 0
    end
    
    it "should return zero for string containing no numerics" do
      sum('uncountable').should == 0
    end
  end
  
  context "two lines" do
    it "should return sum of both lines" do
      sum("456\n123").should == 456 + 123
    end
  end
end