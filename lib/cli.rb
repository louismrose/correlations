$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'correlation_calculator'

class Cli  
  def run
    if wrong_arguments?
      print_usage
    else
      print_correlations
    end
  end
  
private
  def wrong_arguments?
    ARGV.size < 2 || ARGV.size > 4
  end
  
  def print_usage
    puts "USAGE: correlations [-threshold N] <phrases> <words>" 
  end
  
  def print_correlations
    CorrelationCalculator.new(ngrams, words, threshold).run.each do |pattern, frequency|
      puts "%.3f #{pattern}" % frequency
    end
  end
  
  def threshold
    has_threshold_argument? ? ARGV[1].to_i : 0
  end
  
  def ngrams
    read_file(has_threshold_argument? ? ARGV[2] : ARGV[0])
  end
  
  def words
    read_file(has_threshold_argument? ? ARGV[3] : ARGV[1])
  end
  
  def has_threshold_argument?
    ARGV.size > 2
  end
  
  def read_file(filename)
    File.readlines(filename).join
  end
end

Cli.new.run
