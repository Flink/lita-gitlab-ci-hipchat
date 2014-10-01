require "spec_helper"

describe Lita::GitlabCi::Author do
  let(:data)   { Fabricate(:gitlabci_author_data) }
  let(:author) { described_class.new(data) }

  describe '#to_s' do
    let(:formatted_author) { "&lt;<a href=\"mailto:tokengeek@gmail.com\">Paul Thornthwaite</a>&gt;" }
    let(:author_string)    { author.to_s }

    it 'returns the Author as a string' do
      expect(author_string).to eq formatted_author
    end
  end
end
