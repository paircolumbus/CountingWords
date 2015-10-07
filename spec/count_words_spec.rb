require 'rspec'
require 'count_words'

describe 'initializing counter' do
  let(:counter) { CountWords.new }

  it 'counters start empty' do
    expected = {}
    expect(counter.counts).to eq expected
  end
end

describe 'counting a single string' do
  let(:counter) { CountWords.new }

  it 'counters have correct values' do
    counter.count_words 'The cat is tall. The cat is much bigger than the mouse.'
    expected = {
      'the'    => 3,
      'cat'    => 2,
      'is'     => 2,
      'tall'   => 1,
      'mouse'  => 1,
      'bigger' => 1,
      'than'   => 1,
      'much'   => 1
    }
    expect(counter.counts).to eq expected
  end
end

describe 'counting two strings' do
  let(:counter) { CountWords.new }

  it 'counters have correct values' do
    counter.count_words 'The cat is tall. The cat is much bigger than the mouse.'
    counter.count_words 'It is bigger on the inside.'
    expected = {
      'the'    => 4,
      'cat'    => 2,
      'is'     => 3,
      'bigger' => 2,
      'tall'   => 1,
      'mouse'  => 1,
      'it'     => 1,
      'than'   => 1,
      'much'   => 1,
      'on'     => 1,
      'inside' => 1
    }
    expect(counter.counts).to eq expected
  end
end

describe 'handle contractions' do
  let(:counter) { CountWords.new }

  it 'counters have correct values' do
    counter.count_words "it's he'll what're 'til wouldn't've"
    expected = {
      "it's"        => 1,
      "he'll"       => 1,
      "what're"     => 1,
      "'til"        => 1,
      "wouldn't've" => 1,
    }
    expect(counter.counts).to eq expected
  end
end

describe 'handle compound words' do
  let(:counter) { CountWords.new }

  it 'counters have correct values' do
    counter.count_words "on-line Hands-on up-to-date"
    expected = {
      "on-line"        => 1,
      "hands-on"       => 1,
      "up-to-date"     => 1,
    }
    expect(counter.counts).to eq expected
  end
end
