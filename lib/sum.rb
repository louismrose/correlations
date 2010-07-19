class Sum
  def initialize(table)
    @table = table
  end
  
  def run
    rows.inject(0) {|sum,element| sum + element.to_i }
  end
  
private
  def rows
    @table.split("\n")
  end
end