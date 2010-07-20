require 'lib/dependency_calculator'

Given /^the following bigram frequencies$/ do |bigrams|
  @bigrams = bigrams
end

Given /^the following unigram frequencies$/ do |unigrams|
  @unigrams = unigrams
end

When "I calculate the dependencies" do
  @dependencies = DependencyCalculator.new(@bigrams, @unigrams).run
end

Then /^the dependency of "([^\"]*)" should be ([\d|.]*)$/ do |bigram, dependency|
  @dependencies[bigram].should be_close dependency.to_f, 0.01
end
  
