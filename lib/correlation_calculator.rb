require 'lib/frequencies'

class CorrelationCalculator

  def initialize(ngram_frequencies, unigram_frequencies)
    @ngram_frequencies   = Frequencies.new(ngram_frequencies)
    @unigram_frequencies = Frequencies.new(unigram_frequencies)
  end

  def run
    correlations = {}
    
    @ngram_frequencies.each do |pattern, frequency|
      correlations[pattern] = calculate_correlation_for(pattern, frequency)
    end
    
    correlations
  end
  
private
  
  def calculate_correlation_for(pattern, w1w2_f)
    words = pattern.split(' ')
    
    word_frequencies = words.map {|w| @unigram_frequencies.frequency_of(w.downcase) }
    
    freq = word_frequencies.inject(1) {|product, f| product *= f}

    (w1w2_f * @unigram_frequencies.total ** words.size).fdiv (freq * @ngram_frequencies.total)
  end
  
end