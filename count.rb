class Wordcount
  attr_reader :file_string, :word_counts
  def initialize(file)
    @file_string = File::read(file)
    @re = /((?!_)\w+(?:'\w+)?(?!=_))/
    @word_counts = Hash.new { |hash, key| hash[key] = 0 }
    @file_string.scan(@re) {|word| @word_counts[word] += 1}
  end
end