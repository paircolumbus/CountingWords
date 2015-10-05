class CountWords
  attr_reader :counts

  def initialize
    clear_counts
  end

  def clear_counts
    @counts = Hash.new { |hash,key| hash[key] = 0 }
  end

  def count_words(input_string)
    words = input_string.split(/[^-a-zA-Z']+/).map do |w|
      w.gsub(/^-+/, '').gsub(/[-']+$/, '').downcase
    end

    words.each { |w| @counts[w] += 1 }
  end
end
