
require 'rspec'
require 'word_counter'

describe "WordCounter" do
	it "should count all words regardless of case" do
		results = WordCounter.count "HELLO hello hElLo HeLlO"
		expect(results[0][0]).to be :hello
		expect(results[0][1]).to eq 4
	end

	it "should only count the words in the input" do
		results = WordCounter.count "a b c"
		expect(results.length).to eq 3
	end

	it "should not count non-word characters in words" do
		results = WordCounter.count "! @ # $ % ^ & * ( )"
		expect(results.index{|entry|entry[0] == "!".to_sym}).to be_nil
	end
	
	it "should extract words among crazy characters" do
		results = WordCounter.count "hello! hello@($there"
		expect(results[0][0]).to be :hello
		expect(results[0][1]).to eq 2
		expect(results[1][0]).to be :there
		expect(results[1][1]).to be 1
	end
	
	it "should sort by count descending" do
		results = WordCounter.count "a a a b b c"
		expect(results[0][0]).to be :a
		expect(results[1][0]).to be :b
		expect(results[2][0]).to be :c
	end
end
