require 'lib/frequency'

class DependencyCalculator

  def initialize(bigram_frequencies, unigram_frequencies)
    @bigram_frequencies = bigram_frequencies
    @no_of_bigrams = @bigram_frequencies.map {|b| b["f"].to_i}.inject(0) {|sum, element| sum += element }
    
    @unigram_frequencies = unigram_frequencies
    @no_of_unigrams = @unigram_frequencies.map {|b| b["f"].to_i}.inject(0) {|sum, element| sum += element }
  end

  def run
    dependencies = {}
    
    @bigram_frequencies.each do |bigram|
      key = bigram["w1"] + ' ' + bigram["w2"]
      dependencies[key] = calculate_dependency_for(bigram["w1"], bigram["w2"], bigram["f"].to_f)
    end
    
    dependencies
  end
  
private
  
  def calculate_dependency_for(w1, w2, w1w2_f)
    w1_f = @unigram_frequencies.find {|u| u["w"] == w1.downcase}["f"].to_i
    w2_f = @unigram_frequencies.find {|u| u["w"] == w2.downcase}["f"].to_i
         
    (w1w2_f * @no_of_unigrams * @no_of_unigrams) / (w1_f * w2_f * @no_of_bigrams)
  end
  
end