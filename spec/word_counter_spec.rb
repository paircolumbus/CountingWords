require 'rspec'
require_relative 'word_counter'

describe 'WordCounter' do 
let (:counter) { WordCounter.new('test.txt')}

	describe '#sanitize_me!' do 
		it 'returns a downcased string without any punctuation' do 
			expect(counter.sanitize_me!('(-@TuNa!$._}')).to eq 'tuna'
		end 
	end 

	describe '#sanitize_array!' do 
		it 'returns an array of downcase strings without any punctuation' do 
			counter.sanitize_array!
			expect(counter.file_array).to eq ['tuna', 'tuna', 'tuna', 'cats', 'cinnamon', 'wow', 'wow', 'wow', 'wow', 'wow']
		end 
	end 

	describe '#calculate_frequencies' do 
		it 'adds each word as a key and its frequency as the value' do
			counter.calculate_frequencies
			expect(counter.word_counts).to eq({ "tuna" => 3, "cats" => 1, "cinnamon" => 1, "wow" => 5 })
		end 
  end 

  describe "#order_frequencies" do 
  	it 'returns the frequency hash in descending order by key value' do 
  		counter.calculate_frequencies
  		counter.order_frequencies
  		expect(counter.word_counts).to eq({"wow" => 5, "tuna" => 3, "cats" => 1, "cinnamon" => 1})
  	end
  end
end 