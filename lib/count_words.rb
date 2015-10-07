class CountWords
  attr_reader :counts

  # Matches normal words, plus contractions and compound words (on-line)
  #   also handles the special case of contractions at the front ('til)
  WORD_REGEX = /'?[a-zA-Z]+(?:[-'][a-zA-Z]+)*/

  def initialize
    @counts = Hash.new(0)
  end

  def count_words(input_string)
    input_string.scan(WORD_REGEX) do |word|
      @counts[word.downcase] += 1
    end
  end
end
