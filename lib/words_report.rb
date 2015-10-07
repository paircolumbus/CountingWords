class WordsReport
  # Arbitrary definition of popular
  POPULAR_COUNT = 5

  attr_reader :word_table

  def initialize(counts)
    @word_table = words_by_frequency counts
  end

  def popular_words(popular_count = POPULAR_COUNT)
    popular_word_table(popular_count).map(&:first)
  end

  def report(popular_count = POPULAR_COUNT)
    popular_word_table(popular_count).each do |entry|
      printf "%-12s: %3d\n", entry.first, entry.last
    end
  end

  def words
    @word_table.map(&:first)
  end

  private

  def words_by_frequency(counts)
    counts.sort_by { |word, count| [-count, word] }
  end

  def popular_word_table(popular_count = POPULAR_COUNT)
    @word_table.take_while { |entry| entry.last >= popular_count }
  end
end
