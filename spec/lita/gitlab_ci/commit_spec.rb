require "spec_helper"

describe Lita::GitlabCi::Commit do
  let(:data)   { Fabricate(:gitlabci_commit_data) }
  let(:commit) { described_class.new(data) }

  describe '#sha' do
    let(:expected_sha) { '34f57f6' }
    let(:sha)          { commit.sha }

    it 'returns a short SHA (7 chars) from commit' do
      expect(sha).to eq expected_sha
    end
  end

  describe '#sha_link' do
    let(:formatted_sha) { "<a href=\"http://localhost:3000/brightbox/brightbox-cli/commit/34f57f6ba3ed0c21c5e361bbb041c3591411176c\">34f57f6</a>" }
    let(:sha_link)      { commit.sha_link }

    it 'returns the SHA formatted' do
      expect(sha_link).to eq formatted_sha
    end
  end

  describe '#title' do
    let(:first_line) { 'Fix server user data update' }
    let(:title)      { commit.title }

    it 'returns the first line of the commit' do
      expect(title).to eq first_line
    end
  end

  describe '#date' do
    let(:formatted_date) { '2014-04-11 15:17' }
    let(:date)           { commit.date }

    it 'returns the date formatted' do
      expect(date).to eq formatted_date
    end
  end

  describe '#author' do
    let(:author_data) { commit.commit.author }
    let(:author)      { commit.author }

    it 'returns a new Author object' do
      expect(Lita::GitlabCi::Author).to receive(:new).with(author_data)
      author
    end
  end

  describe '#to_s' do
    let(:formatted_commit) { "<pre>  <a href=\"http://localhost:3000/brightbox/brightbox-cli/commit/34f57f6ba3ed0c21c5e361bbb041c3591411176c\">34f57f6</a> — Fix server user data update (2014-04-11 15:17) &lt;<a href=\"mailto:tokengeek@gmail.com\">Paul Thornthwaite</a>&gt;</pre>" }
    let(:commit_string)    { commit.to_s }

    it 'returns the Commit as a string' do
      expect(commit_string).to eq formatted_commit
    end
  end
end
