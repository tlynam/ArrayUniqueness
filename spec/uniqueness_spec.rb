require_relative '../lib/uniqueness'

RSpec.describe Uniqueness, "#unique" do
  it "raises an exception if argument isn't an array" do
    expect {
      described_class.unique("1, 2, 3")
    }.to raise_error(ArgumentError)
  end

  it 'returns an unique array' do
    array = %w[test1 test2 test3 test2 test3 test1 test3]
    expect(described_class.unique(array)).to match_array(%w[test1 test2 test3])
  end

  it 'returns an unique array in the original order' do
    array = %w[test1 test2 test3 test2 test3 test1 test3]
    expect(described_class.unique(array)).to eq(%w[test1 test2 test3])
  end

  it 'returns an unique array under 1 second with a 1 million sized array' do
    emails = 10.times.map { |i| "test#{i}@example.com" }
    emails = 100_000.times.flat_map { emails }

    start_time = Time.now
    return_array = described_class.unique(emails)
    end_time = Time.now

    expect(end_time - start_time).to be < 1
  end
end
