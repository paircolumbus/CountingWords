def get_occurences(words)
  words.each_with_object Hash.new 0 do |word, occurences|
    occurences[word] += 1
  end
end

def get_words(text)
  text.split /\W+/
end

def print_occurences(occurences)
  occurences.sort_by do |word, occurences|
    -occurences
  end.each do |word, occurences|
    puts "#{occurences} - #{word}"
  end
end

speech = File.open('speech.txt').read
print_occurences get_occurences get_words speech
