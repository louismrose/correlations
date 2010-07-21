require 'lib/correlation_calculator'

class Cli
  def run(arguments)
    if wrong_arguments?
      print_usage
    else
      ngrams = readfile(arguments[0])
      words  = readfile(arguments[1])
    
      print_correlations(ngrams, words)
    end
  end
  
private
  def wrong_arguments?
    ARGV.size != 2
  end
  
  def print_usage
    puts "USAGE: correlations <phrases> <words>" 
  end
  
  def read_file(filename)
    File.readlines(filename).join
  end
  
  def print_correlations(ngrams, words)
    CorrelationCalculator.new(ngrams, words).run.each do |pattern, frequency|
      puts "%.3f #{pattern}" % frequency
    end
  end
end

Cli.new.run ARGV
