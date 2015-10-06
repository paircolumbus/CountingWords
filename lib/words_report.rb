class WordsReport
  attr_reader :words

  # Arbitrary definition of popular
  POPULAR_COUNT = 5

  def initialize(counts)
    @counts = counts
    @words = words_by_frequency
  end

  def popular_words(popular_count = POPULAR_COUNT)
    @words.select { |word| @counts[word] >= popular_count }
  end

  def report(popular_count = POPULAR_COUNT)
    popular_words(popular_count).each { |word| printf "%-12s: %3d\n", word, @counts[word] }
  end

  private

  def words_by_frequency
    @words = @counts.keys.sort { |a,b| [@counts[b], a] <=> [@counts[a], b] }
  end
end
