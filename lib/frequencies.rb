class Frequencies
  def initialize(raw)
    @table = {}
    
    raw.each_line do |line|
      frequency = line.split(' ')[0].to_i
      pattern   = line.split(' ')[1..-1].join(' ')
      
      @table[pattern] = frequency
    end
  end
  
  def each &iterator
    @table.each &iterator
  end
  
  def total
    @table.values.inject(0) {|sum, element| sum += element }
  end
  
  def frequency_of(pattern)
    @table[pattern]
  end
end