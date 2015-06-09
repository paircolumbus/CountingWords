class WC
  attr_reader :input, :lines, :bag

  def initialize args = $stdin
    @bag = Hash.new(0)
    @lines = []
    @input = args
  end

  def run!
    read_in
    words_into_bag
    sort_bag
    print_bag
  end


  def read_in
    @input.each do |line| 
      line.downcase!
      line.chomp!
      line.delete!('^[a-z- ]')
      @lines.push line
    end
    @lines
  end

  def words_into_bag
    @lines.each do |line|
      wordsInLine = line.split(/ +/)
      wordsInLine.each do |word|
        bag[word] += 1
      end
    end
  end

  def sort_bag
    @bag = bag.sort_by{|k, v| -v}
  end

  def print_bag
    @bag.each do |tuple|
      val = tuple[1]
      key = tuple[0]
      puts "#{val} - #{key}"
    end
  end
end

#wc = WC.new
#wc.run!