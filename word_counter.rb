require 'pry'

class WordCounter
	attr_reader :file_array, :word_counts

	def initialize(filename)
		@word_counts = {}
		@file = File.read(filename)
		@file_array = get_words
	end 

	def run! 
		calculate_frequencies
		order_frequencies
		show_frequencies
	end 

	def calculate_frequencies
		sanitize_array!	
		@file_array.each { |word| @word_counts.has_key?(word) ? @word_counts[word] += 1 : @word_counts[word] = 1 }
	end 

	def order_frequencies
		@word_counts.sort_by {|k, v| v}.reverse
	end  

	def show_frequencies 
		order_frequencies.each {|k, v| puts "#{v} - #{k}" }
	end 

	def get_words
		@file.split(/\n|\s/)
	end 

	def sanitize_array!
		@file_array.each {|string| sanitize_me!(string)}
	end 

	def sanitize_me!(word)
		word.downcase!
	  	word.gsub!(/(\W|\d|_)/, '')
	end 
end 
