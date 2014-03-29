require 'bio'

require 'genome/coding_sequence'
require 'genome/coding_sequence_set'

class Genome
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def coding_sequences
    CodingSequenceSet.new(entry)
  end

  def sequence_range(range)
    entry.naseq[range]
  end

  def species
    entry.source.fetch("common_name")
  end

  private

  def entry
    @entry ||= Bio::FlatFile.auto(path).first
  end
end