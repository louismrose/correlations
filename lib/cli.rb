require 'lib/dependency_calculator'

class Cli
  def run(arguments)
    bigrams  = File.readlines(arguments[0]).join
    unigrams = File.readlines(arguments[1]).join
    
    DependencyCalculator.new(bigrams, unigrams).run.each do |pattern, frequency|
      puts "%.3f #{pattern}" % frequency
    end
  end
end

Cli.new.run ARGV
