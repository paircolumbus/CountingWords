require 'pry'

class WordCounter
  def load_file(filename)
    @words = {}
    @text = File.read(filename)
    @text.split(/\b/).grep(/[a-zA-Z]/).map { |word| 
      @words[word] = @words.fetch(word, 0) + 1 
    }
    
    #print output
    @words.sort_by(&:last).reverse.first(10).each { |key, value|
      puts "#{value} - #{key}"
    }

  end


end

WordCounter.new.load_file 'speech.txt'
