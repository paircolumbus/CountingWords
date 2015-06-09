require 'rspec'
require 'wc'

describe 'WC' do 
  #let (:wc) {WC.new}

  it '.read_in' do
    testString = "The cat is tall. The cat is much bigger than the mouse.\n"
    expected = ["the cat is tall the cat is much bigger than the mouse"]
    input = StringIO.new(testString)
    wc = WC.new input
    result = wc.read_in
    expect(result).to eq expected
  end
end