def count_words(filepath)
	#wordToCount will map unique words to their count in the contents string
	wordToCount = Hash.new

	#Read a file at the specified path into a string (from http://stackoverflow.com/a/131001/1133921)
	contents = File.open(filepath, "rb").read

	#Lower-case, then split the string on any non-word character(s). We then sort this array
	words = contents.downcase.split(/[\W_]+/).sort #Underscore is NOT captured by \W!

	#Because our words array is sorted, group each contiguous sub-array of the same word into chunks, and
	#add that word key along with its count value into our wordToCount dictionary.
	#(based off the Enumerable rubydoc)
	words.chunk {|word| word}.each {|wordElement, wordElementList| wordToCount[wordElement] = wordElementList.length}

	#Sort the dictionary by value, descending (from http://stackoverflow.com/a/4266496/1133921)
	sortedWordToCount = wordToCount.sort_by {|key, value| value}.reverse

	#Print the results, making sure to convert both keys and values to strings to avoid nasty implicit conversion errors
	sortedWordToCount.each {|key, value| p key.to_s + " - " + value.to_s}
end

count_words("speech.txt")
#count_words("word_counter.rb")  :P