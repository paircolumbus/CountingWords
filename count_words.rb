require_relative 'lib/count_words'
require_relative 'lib/words_report'

counter = CountWords.new

File.open('speech.txt') do |file|
  file.each_line { |line| counter.count_words(line) }
end

WordsReport.new(counter.counts).report(10)
