require 'lib/correlation_calculator'

Given /^the following n-gram frequencies$/ do |ngrams|
  @ngrams = ngrams
end

Given /^the following word frequencies$/ do |unigrams|
  @unigrams = unigrams
end

When "I calculate the correlations" do
  @correlations = CorrelationCalculator.new(@ngrams, @unigrams).run
end

Then /^the correlation of "([^\"]*)" should be ([\d|.]*)$/ do |ngram, expected_correlation|
  @correlations[ngram].should be_close expected_correlation.to_f, 0.01
end
  
