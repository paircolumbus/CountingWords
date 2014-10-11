def read_file(file_name)
	count = Hash.new(0)

	File.readlines(file_name).each do |line|
		words = line.split(/\W+/)
		words.each { |w| count[w] += 1 }
	end

	count = count.sort_by { |x, y| y }
	count.reverse!
	count.each { |word, count| puts count.to_s + "-" + word }
end

read_file('speech.txt')