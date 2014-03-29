require 'genome'

describe Genome do
  it "takes a path to gbk file and returns a list of genes" do
    genome = Genome.new("specs/fixtures/dataset.gbk")
    expect(genome.coding_sequences.count).to equal(2650)
  end

  it "gets the dna representing a coding_sequence" do
    genome = Genome.new("specs/fixtures/dataset.gbk")
    coding_sequence = genome.coding_sequences.first
    strand = genome.sequence_range(coding_sequence.range)

    expect(strand.length).to equal(1362)
  end

  it "references the specie" do
    genome = Genome.new("specs/fixtures/dataset.gbk")
    expect(genome.species).to eq("Staphylococcus aureus 04-02981")
  end
end