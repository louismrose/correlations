require 'lib/dependency_calculator'

Given "the following bigram frequencies:" do |bigram_frequencies_table|
  @bigrams = bigram_frequencies_table.hashes
end

Given "the following unigram frequencies:" do |unigram_frequencies_table|
  @unigrams = unigram_frequencies_table.hashes
end

When "I calculate the dependencies" do
  @dependencies = DependencyCalculator.new(@bigrams, @unigrams).run
end

Then /^the dependency of "([^\"]*)" should be ([\d|.]*)$/ do |bigram, dependency|
  @dependencies[bigram].should be_close dependency.to_f, 0.01
end
  
