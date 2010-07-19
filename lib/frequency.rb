class Frequency

  def initialize(table)
    @table = table
  end
  
  def run(desired)
    table_contains(desired) ? frequency(desired) : 0
  end
  
private
  def table_contains(desired)
    match(desired) != nil
  end

  def frequency(desired)
    match(desired)[1].to_i
  end

  def match(desired)
    /(\d*)\s+#{desired}$/.match(@table)
  end
end