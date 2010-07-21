require 'lib/frequencies'

class CorrelationCalculator

  def initialize(ngram_frequencies, word_frequencies)
    @ngram_frequencies = Frequencies.new(ngram_frequencies)
    @word_frequencies  = Frequencies.new(word_frequencies)
  end

  def run
    correlations = {}
    
    @ngram_frequencies.each do |ngram, frequency|
      correlations[ngram] = calculate_correlation_for(ngram)
    end
    
    correlations
  end
  
private
  
  # correlation = ln(P(ngram) / (P(w1) * P(w2) * ... * P(wn)))
  def calculate_correlation_for(ngram)
    words = ngram.split(' ')
    
    word_probabilities = words.map {|w| @word_frequencies.probability_of(w.downcase) }
    
    product_of_word_probabilities = word_probabilities.inject(1) {|product, p| product *= p}
    
    Math.log(@ngram_frequencies.probability_of(ngram) / product_of_word_probabilities) 
  end
  
end