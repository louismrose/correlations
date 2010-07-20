require 'lib/frequencies'

class DependencyCalculator

  def initialize(bigram_frequencies, unigram_frequencies)
    @bigram_frequencies  = Frequencies.new(bigram_frequencies)
    @unigram_frequencies = Frequencies.new(unigram_frequencies)
  end

  def run
    dependencies = {}
    
    @bigram_frequencies.each do |pattern, frequency|
      dependencies[pattern] = calculate_dependency_for(pattern, frequency)
    end
    
    dependencies
  end
  
private
  
  def calculate_dependency_for(pattern, w1w2_f)
    w1 = pattern.split(' ')[0]
    w2 = pattern.split(' ')[1]
        
    w1_f = @unigram_frequencies.frequency_of(w1.downcase)
    w2_f = @unigram_frequencies.frequency_of(w2.downcase)

    (w1w2_f * @unigram_frequencies.total ** 2).fdiv (w1_f * w2_f * @bigram_frequencies.total)
  end
  
end