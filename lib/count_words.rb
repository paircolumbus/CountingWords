class CountWords
  attr_reader :counts, :total_word_count

  def initialize
    clear_counts
    @total_word_count = 0
  end

  def clear_counts
    @counts = Hash.new { |hash,key| hash[key] = 0 }
  end

  def count_words(input_string)
    words = input_string.split(/[^-a-zA-Z']+/).map do |w|
      w.gsub(/^-+/, '').gsub(/[-']+$/, '').downcase
    end

    words.each do |w|
      @counts[w] += 1
      @total_word_count += 1
    end
  end
end
