class Frequencies
  def initialize(table)
    @table = table
  end
  
  def each &iterator
    @table.each &iterator
  end
  
  def total
    all_frequencies.inject(0) {|sum, element| sum += element }
  end
  
  def frequency_of(word)
    @table.find {|u| u["w"] == word.downcase}["f"].to_i
  end
  
private
  def all_frequencies
    @table.map {|row| row["f"].to_i}
  end
end