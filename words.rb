speech = []
words = Hash.new(0)

File.open('speech.txt') do |file|
	while line = file.gets
		speech += line.chomp!.gsub(/[^\w\s]/, '').split(" ")
  end
end

speech.each { |word| words[word] += 1 }

words.sort.each { |key, value| puts "#{key} : #{value}" }