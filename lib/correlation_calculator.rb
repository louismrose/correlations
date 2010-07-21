require 'lib/frequencies'

class CorrelationCalculator

  def initialize(ngram_frequencies, word_frequencies, threshold)
    @ngrams = Frequencies.new(ngram_frequencies)
    @words  = Frequencies.new(word_frequencies)
    @threshold = threshold
  end

  def run
    correlations = {}
    
    @ngrams.each do |ngram, frequency|
      correlations[ngram] = calculate_correlation_for(ngram)
    end
    
    correlations
  end
  
private
  
  # correlation = ln(P(ngram) / (P(w1) * P(w2) * ... * P(wn)))
  def calculate_correlation_for(ngram)
    words = ngram.split(' ')
    
    if any_word_is_below_the_threshold?(words)
      0
    else
      Math.log(@ngrams.probability_of(ngram) / product_of_probabilities_for(words))
    end
  end
  
  def any_word_is_below_the_threshold?(words)
    words.any? {|w| @words.frequency_of(w) <= @threshold}
  end
  
  # calculates P(w1) * P(w2) * ... * P(wn)
  def product_of_probabilities_for(words)
    word_probabilities = words.map {|w| @words.probability_of(w) }

    word_probabilities.inject(1) {|product, p| product *= p}   
  end
  
end