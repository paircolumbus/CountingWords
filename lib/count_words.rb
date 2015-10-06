class CountWords
  attr_reader :counts

  def initialize
    clear_counts
  end

  def clear_counts
    @counts = Hash.new(0)
  end

  def count_words(input_string)
    words = input_string.scan(/'?[a-zA-Z]+(?:[-'][a-zA-Z]+)*/).map(&:downcase)
    words.each do |w|
      @counts[w] += 1
    end
  end
end
