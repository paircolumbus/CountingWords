
class WordCounterResult < Array 
  def human_format
  	map{|entry| "#{entry[1]}: #{entry[0]}"}.join("\n")
	end
end

class WordCounter
  def self.count input
		# extract words with scan, group them by lowercase versions, map the grouping hash to an array of arrays [word, count] and sort them by count descending
		# then wrap that whole thing in a WordCounterResult
		WordCounterResult.new input.scan(/\w+/).group_by{|x|x.downcase}.map{|word,words| [word.to_sym,words.count]}.sort{|a,b| b[1] <=> a[1] }
	end
end

# if running from the command line, parse ../speech.txt
if File.identical? __FILE__, $0
  file_path = File.expand_path "../../speech.txt", __FILE__
  file = File.open(file_path, "r")
  data = file.read
  file.close
	puts WordCounter.count(data).human_format
end

