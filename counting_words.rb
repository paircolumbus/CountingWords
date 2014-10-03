require 'pry'


class Counter

  def initialize(file)
    @file = file
    @histogram = Hash.new
    parse
  end


  def parse
    lines = IO.readlines @file

    lines.each do |line|
      line.scan(/[\w-]+/).each do |word|
        if @histogram.key? word
          @histogram[word] += 1
        else
          @histogram[word] = 1
        end
      end
    end
    order!
  end

  def order!
    sorted = @histogram.sort.sort do |a,b|
      b.last <=> a.last
    end
    @histogram = sorted
  end

  def print(top_n_words=0)
    @histogram[0..(top_n_words-1)].each do |tuple|
      puts "#{tuple.first}: #{tuple.last}"
    end
  end
end


counter = Counter.new('speech.txt')
counter.print
