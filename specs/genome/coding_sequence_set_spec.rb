require "genome/coding_sequence_set"

describe CodingSequenceSet do
  let(:entry) do
    features = 100.times.map { double(feature: 'CDS') }
    double(features: features)
  end

  it "takes a genbank entry and gets the list of coding sequences" do
    cds = CodingSequenceSet.new(entry)
    expect(cds.count).to equal(100)
  end
end