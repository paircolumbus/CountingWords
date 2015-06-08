$wordDict = Hash.new(0)

def parseFile(filename)
  File.open(filename, 'r') do |file|
    countWords(file)
  end
  printWordCount
end

def countWords(file)
  file.each_line do |line|
    words = line.gsub(/[^a-zA-z]+/, ' ').strip.split
    words.map! { |x| x.downcase }
    words.each { |w| $wordDict[w] += 1 }
  end
end

def sortWordDict
  $wordDict.sort_by { |word, count| count }.reverse
end

def printWordCount
  sortWordDict.each { |word, count| puts "#{count} - #{word}" }
end

parseFile('speech.txt')
