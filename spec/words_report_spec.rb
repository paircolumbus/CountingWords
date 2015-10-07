require 'rspec'
require 'words_report'

TEST_DATA = {
  'the'   => 33,
  'to'    => 26,
  'our'   => 11,
  'in'    => 14,
  'as'    => 13,
  'of'    => 36,
  'it'    => 12,
  'that'  => 11,
  'their' => 10,
  'i'     => 22,
  'and'   => 19,
  'a'     => 16
}

describe WordsReport do
  let(:report) { WordsReport.new({}) }
  it '#initialize' do
    expect(report.words).to be_instance_of Array
  end

  context 'verify interface' do
    it '#words' do
      expect(report).to respond_to(:words)
    end
    it '#word_table' do
      expect(report).to respond_to(:word_table)
    end
    it '#popular_words' do
      expect(report).to respond_to(:popular_words)
    end
    it '#report' do
      expect(report).to respond_to(:report)
    end
  end
end

describe 'sort functionality' do
  let(:report) { WordsReport.new(TEST_DATA) }

  it '#words are sorted' do
    expect(report.words).to eq %W{of the to i and a in as it our that their}
  end

  it '#popular_words are most popular' do
    expect(report.popular_words(25)).to eq %W{of the to}
  end
end
